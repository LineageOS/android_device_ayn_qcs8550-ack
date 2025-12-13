/*
 * SPDX-FileCopyrightText: The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#include "ayn_bootloader_payload_updater.h"
#include <android-base/logging.h>
#include <android-base/properties.h>
#include <fstream>
#include <iostream>
#include <vector>

namespace fs = std::filesystem;

static std::vector<std::string> common_partitions = {
    "aop",
    "aop_config",
    "cpucp",
    "devcfg",
    "dsp",
    "hyp",
    "imagefv",
    "keymaster",
    "multiimgqti",
    "qupfw",
    "shrm",
    "tz",
    "uefisecapp",
    "xbl_ramdump",
};

static std::vector<std::string> specific_partitions = {
    "abl",
    "bluetooth",
    "dtbo",
    "multiimgoem",
    "modem",
    "uefi",
    "xbl",
    "xbl_config",
};

BLStatus AynPayloadUpdate::OTAUpdater() {
    BLStatus status;

    hardware = android::base::GetProperty("ro.hardware", "");
    if (hardware.empty())
        return kInternalError;

    // First ensure that all requested firmware exists
    for (const auto& part : common_partitions) {
        if (!FirmwareExists(part, false)) {
            LOG(ERROR) << "Partition " << part << " update image missing" << std::endl;
            return kBlobOpenFailed;
        }
    }
    for (const auto& part : specific_partitions) {
        if (!FirmwareExists(part, true)) {
            LOG(ERROR) << "Partition " << part << " update image missing for "
                       << hardware << "." << std::endl;
            return kBlobOpenFailed;
        }
    }

    // If all is available, now do the updates
    for (const auto& part : common_partitions) {
        status = WriteToPartition(part, false);
        if (status != kSuccess) {
            LOG(ERROR) << "Partition " << part << " update failed. Status: "
                << static_cast<int>(status);
            return status;
        }
    }
    for (const auto& part : specific_partitions) {
        status = WriteToPartition(part, true);
        if (status != kSuccess) {
            LOG(ERROR) << "Partition " << part << " update failed. Status: "
                << static_cast<int>(status);
            return status;
        }
    }

    return status;
}

uint8_t target_slot;

AynPayloadUpdate::AynPayloadUpdate() {
    // If suffix prop is empty, guess slot a
    std::string target_suffix = android::base::GetProperty("ro.boot.slot_suffix", "");
    // slot is the target slot, so opposite of current
    target_slot = (target_suffix.compare("_b") == 0 ? 0 : 1);
}

AynPayloadUpdate::~AynPayloadUpdate() {
}

bool AynPayloadUpdate::FirmwareExists(std::string part, bool device_specific) {
    std::string fw_path = (device_specific ? hardware + "_" : "") + part + ".img";

    return fs::is_regular_file(std::string(FIRMWARE_PATH) + fw_path);
}

BLStatus AynPayloadUpdate::WriteToPartition(std::string part, bool device_specific) {
    std::string fw_path = (device_specific ? hardware + "_" : "") + part + ".img";
    std::string part_w_slot = part + (target_slot ? "_b" : "_a");
    BLStatus status = kSuccess;

    std::ifstream infile(FIRMWARE_PATH + fw_path, std::ios::in | std::ios::binary);
    if (!infile.is_open())
        return kBlobOpenFailed;

    infile.seekg(0, std::ios::end);
    std::streamsize size = infile.tellg();
    infile.seekg(0, std::ios::beg);

    std::vector<char> buffer(size + 1);
    if (!infile.read(buffer.data(), size))
        return kBlobOpenFailed;

    infile.close();

    std::ofstream outdev(PARTITION_PATH + part_w_slot, std::ios::out | std::ios::binary);
    if (!outdev.is_open())
        return kWriteError;

    outdev.write(buffer.data(), buffer.size());
    if (!outdev.good()) {
        std::cout << "Failed to write " << fw_path << " to " << part_w_slot << std::endl;
        return kWriteError;
    }

    outdev.close();

    return kSuccess;
}

int main() {
    AynPayloadUpdate updater;

    BLStatus status = updater.OTAUpdater();

    return status;
}
