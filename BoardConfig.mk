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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).
USE_CAMERA_STUB := true
# Additional Camera hacks
TARGET_LEGACY_CAMERA := true
TARGET_CAMERA_WRAPPER := qsd8k
BOARD_HAVE_HTC_FFC := true

# inherit from the proprietary version
-include vendor/htc/supersonic/BoardConfigVendor.mk

TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := supersonic
TARGET_SPECIFIC_HEADER_PATH := device/htc/supersonic/include

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER      := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_wext
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WLAN_DEVICE                := bcm4329
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA          := "/system/vendor/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP           := "/system/vendor/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG           := "iface_name=wlan firmware_path=/system/vendor/firmware/fw_bcm4329.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME          := "bcm4329"

BOARD_USES_GENERIC_AUDIO := false
# prevent breakage from QCOM_HARDWARE in system/audio.h
COMMON_GLOBAL_CFLAGS += -DLEGACY_AUDIO_COMPAT

BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_NEW_PPPOX := true

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_VENDOR_QCOM_AMSS_VERSION := 3200

BOARD_VENDOR_USE_AKMD := akm8973

# Hardware rendering
BOARD_EGL_CFG           := device/htc/supersonic/prebuilt/lib/egl/egl.cfg
USE_OPENGL_RENDERER     := true
TARGET_USES_GENLOCK     := true
# Unneccesary with new egl libs
#COMMON_GLOBAL_CFLAGS   += -DMISSING_EGL_EXTERNAL_IMAGE -DMISSING_EGL_PIXEL_FORMAT_YV12
# We only have 2 buffers so still neccesary to hack it.
COMMON_GLOBAL_CFLAGS    += -DMISSING_GRALLOC_BUFFERS #-DFORCE_EGL_CONFIG=0x9
# Unneccesary. Just a safety measure to make sure its all included
COMMON_GLOBAL_CFLAGS    += -DQCOM_HARDWARE
# Force refresh rate since fps calc is broke and reports 0
COMMON_GLOBAL_CFLAGS    += -DREFRESH_RATE=60
# qsd dont have overlay
TARGET_USE_OVERLAY      := false
# qsd dont have bypass
TARGET_HAVE_BYPASS      := false
# qsd dont support c2d
TARGET_USES_C2D_COMPOSITION := false

# Try to use ASHMEM if possible (when non-MDP composition is used)
# if enabled, set debug.sf.hw=1 in system.prop
# This is still confusing to me disabling for now since pmem and mdp seems to work fine
#TARGET_GRALLOC_USES_ASHMEM := true

# Find out what these do..if anything
# used in cafs tree nothing actually present is ours (yet)
#HAVE_ADRENO200_SOURCE := true
#HAVE_ADRENO200_SC_SOURCE := true
#HAVE_ADRENO200_FIRMWARE := true
#BOARD_USES_QCNE := true
# I dont think these do anything but everyone else is using them
#BOARD_USE_QCOM_PMEM := true
#BOARD_USES_ADRENO_200 := true
#TARGET_HARDWARE_3D := false
# Debuging egl
COMMON_GLOBAL_CFLAGS += -DEGL_TRACE #-DDEBUG_CALC_FPS

TARGET_FORCE_CPU_UPLOAD  := true
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
#BOARD_USES_LEGACY_QCOM := true

BOARD_USE_OPENSSL_ENGINE := true

BOARD_USE_FROYO_LIBCAMERA := true
BOARD_USE_REVERSE_FFC := true

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := supersonic
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240

BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

BOARD_HAVE_SQN_WIMAX := true

TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

# # cat /proc/mtd
# dev:    size   erasesize  name
# mtd0: 00c00000 00020000 "wimax"
# mtd1: 000a0000 00020000 "misc"
# mtd2: 00500000 00020000 "recovery"
# mtd3: 00280000 00020000 "boot"
# mtd4: 15e00000 00020000 "system"
# mtd5: 09f00000 00020000 "cache"
# mtd6: 1aba0000 00020000 "userdata"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00280000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x15e00000   # limited so we enforce room to grow
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x1aba0000

BOARD_FLASH_BLOCK_SIZE := 131072

# Force use of power button in recovery for Supersonic
BOARD_HAS_NO_SELECT_BUTTON := 1

#TARGET_RECOVERY_UI_LIB := librecovery_ui_supersonic librecovery_ui_htc

TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
TARGET_PREBUILT_KERNEL := device/htc/supersonic/kernel
