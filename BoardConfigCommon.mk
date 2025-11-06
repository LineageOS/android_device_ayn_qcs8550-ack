#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mainline/qcom-common
include device/mainline/qcom-common/BoardConfigMainlineQcomCommon.mk

# Board
TARGET_BOARD_PLATFORM := kalama

# Bootloader
BOARD_BOOT_HEADER_VERSION := 4
BOARD_INIT_BOOT_HEADER_VERSION := 4
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
BOARD_MKBOOTIMG_INIT_ARGS += --header_version $(BOARD_INIT_BOOT_HEADER_VERSION)
BOARD_RAMDISK_USE_LZ4 := true
