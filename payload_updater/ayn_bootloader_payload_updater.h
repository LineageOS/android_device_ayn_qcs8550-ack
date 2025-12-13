/*
 * SPDX-FileCopyrightText: The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#ifndef NV_BOOTLOADER_PAYLOAD_UPDATER_H_
#define NV_BOOTLOADER_PAYLOAD_UPDATER_H_

#include <string>

#define PARTITION_PATH "/dev/block/by-name/"
#define FIRMWARE_PATH  "/postinstall/etc/firmware/"

#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))

enum BLStatus{
   kSuccess = 0,
   kBlobOpenFailed,
   kInternalError,
   kWriteError,
   kStatusMax
};

class AynPayloadUpdate {
 public:
    AynPayloadUpdate();
    ~AynPayloadUpdate();

    BLStatus OTAUpdater();

 private:
    std::string hardware;

    bool FirmwareExists(std::string part, bool device_specific);
    BLStatus WriteToPartition(std::string part, bool device_specific);
};

#endif  // AYN_BOOTLOADER_PAYLOAD_UPDATER_H_
