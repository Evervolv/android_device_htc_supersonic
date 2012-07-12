#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic supersonic,
# not specialized for any geography.
#

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/gps.conf:system/etc/gps.conf

PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/root/init.supersonic.rc:root/init.supersonic.rc \
    device/htc/supersonic/prebuilt/root/init.supersonic.usb.rc:root/init.supersonic.usb.rc \
    device/htc/supersonic/prebuilt/root/ueventd.supersonic.rc:root/ueventd.supersonic.rc 

$(call inherit-product-if-exists, vendor/htc/supersonic/supersonic-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.com.google.locationfeatures=1 \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	ro.opengles.version=131072

DEVICE_PACKAGE_OVERLAYS += device/htc/supersonic/overlay

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml

#
# Packages needed for Supersonic
#
# Sensors
PRODUCT_PACKAGES := \
    gps.supersonic \
    lights.supersonic \
    sensors.supersonic \
#    camera.qsd8k

# USB
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/usr/keylayout/supersonic-keypad.kl:system/usr/keylayout/supersonic-keypad.kl \
    device/htc/supersonic/prebuilt/usr/keychars/supersonic-keypad.kcm.bin:system/usr/keychars/supersonic-keypad.kcm.bin \
    device/htc/supersonic/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/supersonic/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/supersonic/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd

PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/htc/supersonic/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# sysctl
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/sysctl.conf:system/etc/sysctl.conf

# Kernel Modules
ifeq (,$(BUILD_KERNEL))
PRODUCT_COPY_FILES += $(shell \
    find device/htc/supersonic/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')
endif

PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/lib/libcryp98.so:system/lib/libcryp98.so

# Temporary camera blob replacement
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/lib/libcamera.so:obj/lib/libcamera.so \
    device/htc/supersonic/prebuilt/lib/libcamera.so:system/lib/libcamera.so

# media profiles and capabilities spec
$(call inherit-product, device/htc/supersonic/media_a1026.mk)

# Common qsd8k stuff
$(call inherit-product, device/htc/qsd8k-common/qsd8k.mk)

$(call inherit-product-if-exists, vendor/htc/supersonic/supersonic-vendor.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := htc_supersonic
PRODUCT_DEVICE := supersonic
PRODUCT_MODEL := Full Android on Supersonic
