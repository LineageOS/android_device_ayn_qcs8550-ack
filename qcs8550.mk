#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_KERNEL_VERSION ?= 6.18
TARGET_QCOM_SOC       := qcs8550

TARGET_AUDIO_HAL       := baylibre
TARGET_POWER_HAL       := perfmgr-lineage
TARGET_USB_GADGET_HAL  := qti
TARGET_USB_HAL         := qti
TARGET_USB_INIT_SCRIPT := qti

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += device/ayn/qcs8550-ack

# Inherit from mainline/qcom-common
include device/mainline/qcom-common/optional/options.mk
$(call inherit-product, device/mainline/qcom-common/mainline_qcom-common.mk)

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

PRODUCT_COPY_FILES += \
    device/ayn/qcs8550-ack/init/init.qcs8550.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcs8550.rc \
    device/ayn/qcs8550-ack/init/ueventd.kalama.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.kalama.rc

# Firmware
PRODUCT_PACKAGES += \
    linux_firmware_qcom-sm8550

# Disable debug and verbose logging by default
ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += log.tag=I
endif

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 36
