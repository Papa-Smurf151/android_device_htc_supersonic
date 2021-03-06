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
	
# Market Fix
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/init.d/99marketfix:system/etc/init.d/99marketfix

PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/root/init.supersonic.rc:root/init.supersonic.rc \
    device/htc/supersonic/prebuilt/root/init.supersonic.usb.rc:root/init.supersonic.usb.rc \
    device/htc/supersonic/prebuilt/root/init.rc:root/init.rc \
    device/htc/supersonic/prebuilt/root/ueventd.supersonic.rc:root/ueventd.supersonic.rc 

$(call inherit-product-if-exists, vendor/htc/supersonic/supersonic-vendor.mk)

PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-sprint-us \
	ro.com.google.locationfeatures=1 \
	ro.cdma.home.operator.numeric=310120 \
	ro.cdma.home.operator.alpha=Sprint \
	ro.setupwizard.enable_bypass=1 \
	ro.media.dec.jpeg.memcap=8000000 \
	ro.opengles.version=131072

DEVICE_PACKAGE_OVERLAYS += device/htc/supersonic/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

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
    sensors.supersonic
	
# OMX Stuff
PRODUCT_PACKAGES := \
    libmm-omxcore \
    Torch \
    Settings
	

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

# SmurfMod Addins to etc for beats audio, xloud, bravia engine, and SmurfMod Settings apk
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/etc/audio/aeqcoe.txt:system/etc/audio/aeqcoe.txt \
    device/htc/supersonic/prebuilt/etc/audio/eqfilter.txt:system/etc/audio/eqfilter.txt \
    device/htc/supersonic/prebuilt/etc/audio/lmfilter.txt:system/etc/audio/lmfilter.txt \
    device/htc/supersonic/prebuilt/etc/audio/situation.txt:system/etc/audio/situation.txt \
    device/htc/supersonic/prebuilt/etc/audio/soundbooster.txt:system/etc/audio/soundbooster.txt \
    device/htc/supersonic/prebuilt/etc/audio/stream_earpiece.txt:system/etc/audio/stream_earpiece.txt \
    device/htc/supersonic/prebuilt/etc/audio/stream_headset.txt:system/etc/audio/stream_headset.txt \
    device/htc/supersonic/prebuilt/etc/audio/stream_speaker.txt:system/etc/audio/stream_speaker.txt \
    device/htc/supersonic/prebuilt/etc/cron/cron.daily/00drop_caches:system/etc/cron/cron.daily/00drop_caches \
    device/htc/supersonic/prebuilt/etc/cron/cron.daily/01clear_cache:system/etc/cron/cron.daily/01clear_cache \
    device/htc/supersonic/prebuilt/etc/cron/cron.hourly/00drop_caches:system/etc/cron/cron.hourly/00drop_caches \
    device/htc/supersonic/prebuilt/etc/cron/cron.hourly/01clear_cache:system/etc/cron/cron.hourly/01clear_cache \
    device/htc/supersonic/prebuilt/etc/cron/cron.weekly/00drop_caches:system/etc/cron/cron.weekly/00drop_caches \
    device/htc/supersonic/prebuilt/etc/cron/cron.weekly/01clear_cache:system/etc/cron/cron.weekly/01clear_cache \
    device/htc/supersonic/prebuilt/etc/cron/cron.conf:system/etc/cron/cron.conf \
    device/htc/supersonic/prebuilt/etc/init.d/00banner:system/etc/init.d/00banner \
    device/htc/supersonic/prebuilt/etc/init.d/01smurfed_debug_db:system/etc/init.d/01smurfed_debug_db \
    device/htc/supersonic/prebuilt/etc/init.d/01sysctl:system/etc/init.d/01sysctl \
    device/htc/supersonic/prebuilt/etc/init.d/02smurfed_cron:system/etc/init.d/02smurfed_cron \
    device/htc/supersonic/prebuilt/etc/init.d/03smurfed_governor_tweaks:system/etc/init.d/03smurfed_governor_tweaks \
    device/htc/supersonic/prebuilt/etc/init.d/04smurfed_ext4_tweaks:system/etc/init.d/04smurfed_ext4_tweaks \
    device/htc/supersonic/prebuilt/etc/init.d/05mountext:system/etc/init.d/05mountext \
    device/htc/supersonic/prebuilt/etc/init.d/05smurfed_loopy_smoothness:system/etc/init.d/05smurfed_loopy_smoothness \
    device/htc/supersonic/prebuilt/etc/init.d/09smurfed_charger_boost:system/etc/init.d/09smurfed_charger_boost \
    device/htc/supersonic/prebuilt/etc/init.d/10apps2sd:system/etc/init.d/10apps2sd \
    device/htc/supersonic/prebuilt/etc/init.d/10smurfed_dump_cache:system/etc/init.d/10smurfed_dump_cache \
    device/htc/supersonic/prebuilt/etc/init.d/11smurfed_remove_logging:system/etc/init.d/11smurfed_remove_logging \
    device/htc/supersonic/prebuilt/etc/init.d/12smurfed_swap:system/etc/init.d/12smurfed_swap \
    device/htc/supersonic/prebuilt/etc/init.d/13smurfed_vm_tweak:system/etc/init.d/13smurfed_vm_tweak \
    device/htc/supersonic/prebuilt/etc/init.d/14smurfed_scheduler:system/etc/init.d/14smurfed_scheduler \
    device/htc/supersonic/prebuilt/etc/init.d/15smurfed_fix_permissions:system/etc/init.d/15smurfed_fix_permissions \
    device/htc/supersonic/prebuilt/etc/init.d/16smurfed_zipalign:system/etc/init.d/16smurfed_zipalign \
    device/htc/supersonic/prebuilt/etc/init.d/17smurfed_boot_animation:system/etc/init.d/17smurfed_boot_animation \
    device/htc/supersonic/prebuilt/etc/init.d/18smurfed_lmk_settings:system/etc/init.d/18smurfed_lmk_settings \
    device/htc/supersonic/prebuilt/etc/init.d/99smurfed_tweaks:system/etc/init.d/99smurfed_tweaks \
    device/htc/supersonic/prebuilt/etc/permissions/com.sonyericsson.audioeffectif.xml:system/etc/permissions/com.sonyericsson.audioeffectif.xml \
    device/htc/supersonic/prebuilt/etc/soundimage/srs_bypass.cfg:system/etc/soundimage/srs_bypass.cfg \
    device/htc/supersonic/prebuilt/etc/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/supersonic/prebuilt/etc/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/supersonic/prebuilt/etc/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/supersonic/prebuilt/etc/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg \
    device/htc/supersonic/prebuilt/etc/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/supersonic/prebuilt/etc/soundimage/srs_global.cfg:system/etc/soundimage/srs_global.cfg \
    device/htc/supersonic/prebuilt/etc/audio_effects.conf:system/etc/audio_effects.conf \
    device/htc/supersonic/prebuilt/etc/basimage_gec.bin:system/etc/basimage_gec.bin \
    device/htc/supersonic/prebuilt/etc/basimage_gec_x.bin:system/etc/ \
    device/htc/supersonic/prebuilt/etc/basimage_ibeats.bin:system/etc/ \
    device/htc/supersonic/prebuilt/etc/basimage_ibeats_solo.bin:system/etc/ \
    device/htc/supersonic/prebuilt/etc/basimage_ibeats_solo_x.bin:system/etc/ \
    device/htc/supersonic/prebuilt/etc/basimage_ibeats_x.bin:system/etc/ \
    device/htc/supersonic/prebuilt/etc/be_movie:system/etc/be_movie \
    device/htc/supersonic/prebuilt/etc/be_photo:system/etc/be_photo \
    device/htc/supersonic/prebuilt/etc/dynimage_gec.bin:system/etc/dynimage_gec.bin \
    device/htc/supersonic/prebuilt/etc/dynimage_gec_x.bin:system/etc/dynimage_gec_x.bin \
    device/htc/supersonic/prebuilt/etc/dynimage_ibeats.bin:system/etc/ \
    device/htc/supersonic/prebuilt/etc/dynimage_ibeats_solo.bin:system/etc/ \
    device/htc/supersonic/prebuilt/etc/dynimage_ibeats_solo_x.bin:system/etc/ \
    device/htc/supersonic/prebuilt/etc/dynimage_ibeats_x.bin:system/etc/ \
    device/htc/supersonic/prebuilt/etc/group:system/etc/group \
    device/htc/supersonic/prebuilt/etc/gshadow:system/etc/gshadow \
    device/htc/supersonic/prebuilt/etc/HP_Audio.csv:system/etc/HP_Audio.csv \
    device/htc/supersonic/prebuilt/etc/passwd:system/etc/passwd \
    device/htc/supersonic/prebuilt/etc/peqimage_gec.bin:system/etc/peqimage_gec.bin \
    device/htc/supersonic/prebuilt/etc/peqimage_gec_x.bin:system/etc/peqimage_gec_x.bin \
    device/htc/supersonic/prebuilt/etc/peqimage_ibeats.bin:system/etc/peqimage_ibeats.bin \
    device/htc/supersonic/prebuilt/etc/peqimage_ibeats_solo.bin:system/etc/peqimage_ibeats_solo.bin \
    device/htc/supersonic/prebuilt/etc/peqimage_ibeats_solo_x.bin:system/etc/peqimage_ibeats_solo_x.bin \
    device/htc/supersonic/prebuilt/etc/peqimage_ibeats_x.bin:system/etc/peqimage_ibeats_x.bin \
    device/htc/supersonic/prebuilt/etc/shadow:system/etc/shadow \
    device/htc/supersonic/prebuilt/etc/SmurfMod_settings.sh:system/etc/SmurfMod_settings.sh

# SmurfMod Addins to Libs for beats audio, xloud, bravia engine
PRODUCT_COPY_FILES += \
    device/htc/supersonic/prebuilt/lib/soundfx/libaudiopreprocessing.so:system/lib/soundfx/libaudiopreprocessing.so \
    device/htc/supersonic/prebuilt/lib/soundfx/libbundlewrapper.so:system/lib/soundfx/libbundlewrapper.so \
    device/htc/supersonic/prebuilt/lib/soundfx/libcyanogen-dsp.so:system/lib/soundfx/libcyanogen-dsp.so \
    device/htc/supersonic/prebuilt/lib/soundfx/libreverbwrapper.so:system/lib/soundfx/libreverbwrapper.so \
    device/htc/supersonic/prebuilt/lib/soundfx/libvisualizer.so:system/lib/soundfx/libvisualizer.so \
    device/htc/supersonic/prebuilt/lib/soundfx/libxloudwrapper.so:system/lib/soundfx/libxloudwrapper.so \
    device/htc/supersonic/prebuilt/lib/libaudioeffect_jni.so:system/lib/libaudioeffect_jni.so \
    device/htc/supersonic/prebuilt/lib/libaudioeq.so:system/lib/libaudioeq.so \
    device/htc/supersonic/prebuilt/lib/libbmpcnv.so:system/lib/libbmpcnv.so \
    device/htc/supersonic/prebuilt/lib/libiwi.so:system/lib/libiwi.so \
    device/htc/supersonic/prebuilt/lib/libiwiOmx.so:system/lib/libiwiOmx.so \
    device/htc/supersonic/prebuilt/lib/libiwiOmxUtil.so:system/lib/libiwiOmxUtil.so \
    device/htc/supersonic/prebuilt/lib/libstagefrighthw_swiqi.so:system/lib/libstagefrighthw_swiqi.so

# media profiles and capabilities spec
$(call inherit-product, device/htc/supersonic/media_a1026.mk)

# Common qsd8k stuff
$(call inherit-product, device/htc/qsd8k-common/qsd8k.mk)

$(call inherit-product-if-exists, vendor/htc/supersonic/supersonic-vendor.mk)


$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

PRODUCT_NAME := cm_supersonic
PRODUCT_DEVICE := supersonic
PRODUCT_MODEL := PC36100
