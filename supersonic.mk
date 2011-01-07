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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/supersonic/gps.conf:system/etc/gps.conf



PRODUCT_COPY_FILES += \
    device/htc/supersonic/init.supersonic.rc:root/init.supersonic.rc


$(call inherit-product-if-exists, vendor/htc/supersonic/supersonic-vendor.mk)


PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.com.google.locationfeatures=1 \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=20000000 \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.dexopt-flags=m=y \
	ro.opengles.version=131072

DEVICE_PACKAGE_OVERLAYS += device/htc/supersonic/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/supersonic/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    librs_jni \
    sensors.supersonic \
    lights.supersonic \
    gralloc.qsd8k \
    copybit.qsd8k \
    gps.supersonic 



# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/supersonic/supersonic-keypad.kl:system/usr/keylayout/supersonic-keypad.kl \
    device/htc/supersonic/supersonic-keypad.kcm.bin:system/usr/keychars/supersonic-keypad.kcm.bin \
    device/htc/supersonic/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/supersonic/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/supersonic/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/supersonic/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Supersonic uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    device/htc/supersonic/vold.fstab:system/etc/vold.fstab \
    device/htc/supersonic/apns-conf.xml:system/etc/apns-conf.xml

# Kernel modules
PRODUCT_COPY_FILES += \
    device/htc/supersonic/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    device/htc/supersonic/modules/ah6.ko:system/lib/modules/ah6.ko \
    device/htc/supersonic/modules/auth_rpcgss.ko:system/lib/modules/auth_rpcgss.ko \
    device/htc/supersonic/modules/backlight.ko:system/lib/modules/backlight.ko \
    device/htc/supersonic/modules/cifs.ko:system/lib/modules/cifs.ko \
    device/htc/supersonic/modules/esp6.ko:system/lib/modules/esp6.ko \
    device/htc/supersonic/modules/exportfs.ko:system/lib/modules/exportfs.ko \
    device/htc/supersonic/modules/fuse.ko:system/lib/modules/fuse.ko \
    device/htc/supersonic/modules/generic_bl.ko:system/lib/modules/generic_bl.ko \
    device/htc/supersonic/modules/ip6_tunnel.ko:system/lib/modules/ip6_tunnel.ko \
    device/htc/supersonic/modules/ipcomp6.ko:system/lib/modules/ipcomp6.ko \
    device/htc/supersonic/modules/lcd.ko:system/lib/modules/lcd.ko \
    device/htc/supersonic/modules/lockd.ko:system/lib/modules/lockd.ko \
    device/htc/supersonic/modules/mip6.ko:system/lib/modules/mip6.ko \
    device/htc/supersonic/modules/nfs.ko:system/lib/modules/nfs.ko \
    device/htc/supersonic/modules/nfs_acl.ko:system/lib/modules/nfs_acl.ko \
    device/htc/supersonic/modules/nfsd.ko:system/lib/modules/nfsd.ko \
    device/htc/supersonic/modules/rpcsec_fss_krb5.ko:system/lib/modules/rpcsec_fss_krb5.ko \
    device/htc/supersonic/modules/sequans_sdio.ko:system/lib/modules/sequans_sdio.ko \
    device/htc/supersonic/modules/sit.ko:system/lib/modules/sit.ko \
    device/htc/supersonic/modules/sunrpc.ko:system/lib/modules/sunrpc.ko \
    device/htc/supersonic/modules/tunnel6.ko:system/lib/modules/tunnel6.ko \
    device/htc/supersonic/modules/xfrm6_mode_beet.ko:system/lib/modules/xfrm6_mode_beet.ko \
    device/htc/supersonic/modules/xfrm6_mode_transport.ko:system/lib/modules/xfrm6_mode_transport.ko \
    device/htc/supersonic/modules/xfrm6_mode_tunnel.ko:system/lib/modules/xfrm6_mode_tunnel.ko \
    device/htc/supersonic/modules/xfrm6_tunnel.ko:system/lib/modules/xfrm6_tunnel.ko \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/supersonic/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product-if-exists, vendor/htc/supersonic/supersonic-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/supersonic/media_a1026.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full.mk)


PRODUCT_NAME := generic_supersonic
PRODUCT_DEVICE := supersonic
