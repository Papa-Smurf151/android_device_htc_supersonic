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
# inherit common defines for all qsd8k devices
include device/htc/qsd8k-common/BoardConfigCommon.mk

TARGET_BOOTLOADER_BOARD_NAME := supersonic

# Kernel defines
BOARD_KERNEL_CMDLINE := no_console_suspend=1
BOARD_KERNEL_BASE := 0x20000000
BOARD_KERNEL_NEW_PPPOX := true

# OpenGL stuff
BOARD_USE_OPENSSL_ENGINE := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Video Devices
BOARD_USE_FROYO_LIBCAMERA := true
BOARD_USE_REVERSE_FFC := true

# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := supersonic
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240

# WIMAX
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

# The size of a block that can be marked bad.
BOARD_FLASH_BLOCK_SIZE := 131072

# Force use of power button in recovery for Supersonic
BOARD_HAS_NO_SELECT_BUTTON := 1

#TARGET_RECOVERY_UI_LIB := librecovery_ui_supersonic librecovery_ui_htc

# Define kernel config for inline building
TARGET_KERNEL_CONFIG    := evervolv_supersonic_defconfig
TARGET_PREBUILT_KERNEL  := device/htc/supersonic/prebuilt/root/kernel

##Testing
TARGET_BOOTANIMATION_PRELOAD :=true
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ENABLE_WEBGL := true
