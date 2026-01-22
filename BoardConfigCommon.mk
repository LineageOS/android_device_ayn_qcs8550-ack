#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Baseline Manifest, must be declared before any module manifests
DEVICE_MANIFEST_FILE ?= device/ayn/qcs8550-ack/manifests/manifest.202604.xml

# Inherit from mainline/qcom-common
include device/mainline/qcom-common/BoardConfigMainlineQcomCommon.mk

# Board
TARGET_BOARD_PLATFORM := kalama

# Bootloader
BOARD_BOOT_HEADER_VERSION := 4
BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x00000000
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_INIT_ARGS += --header_version $(BOARD_INIT_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true

# DTB
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_KERNEL_PLATFORM_TARGET := qcs8550
TARGET_KERNEL_SOURCE          := vendor/ayn/$(TARGET_KERNEL_PLATFORM_TARGET)
BOARD_KERNEL_IMAGE_NAME       := Image
BOARD_KERNEL_PAGESIZE         := 4096
endif
BOARD_KERNEL_CMDLINE          := firmware_class.path=/vendor/firmware,/system/firmware cpufreq.default_governor=performance allow_mismatched_32bit_el0
include device/ayn/qcs8550-ack/modules.mk

# Recovery
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += \
    device/ayn/qcs8550-ack/sepolicy/vendor

# Wifi
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_HAL_INTERFACE_COMBINATIONS := {{{AP}, 1}}, {{{STA}, 1}}
