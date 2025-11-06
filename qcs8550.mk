#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_KERNEL_VERSION ?= 6.18
TARGET_QCOM_SOC       := qcs8550

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += device/ayn/qcs8550-ack

# Inherit from mainline/qcom-common
include device/mainline/qcom-common/optional/options.mk
$(call inherit-product, device/mainline/qcom-common/mainline_qcom-common.mk)

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

PRODUCT_COPY_FILES += \
    device/ayn/qcs8550-ack/init/init.qcs8550.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcs8550.rc

# Shipping API
PRODUCT_SHIPPING_API_LEVEL := 36
