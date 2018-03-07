#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/huawei/federer

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
TARGET_BOARD_PLATFORM := msm8916

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8916
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlyprintk androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_DTBTOOL_ARGS := -2
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_USES_UNCOMPRESSED_KERNEL := true
TARGET_KERNEL_SOURCE := kernel/huawei/t2-common/
TARGET_KERNEL_CONFIG := msm-fdr_defconfig

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_HUAWEI_SOUND_PARAM_PATH := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := false
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Bootanimation
#TARGET_BOOTANIMATION_PRELOAD := true
#TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
#TARGET_USE_VENDOR_CAMERA_EXT := true
TARGET_USES_MEDIA_EXTENSIONS := true
#TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
#TARGET_HAS_LEGACY_CAMERA_HAL1 := true
#BOARD_CAMERA_SENSORS := imx219_liteon_pad gc2355_ofilm_ohw2f03_pad

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BACKLIGHT_PATH := /sys/class/leds/lcd-backlight/brightness

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# FM
#AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
#BOARD_HAVE_QCOM_FM := true
#TARGET_QCOM_NO_FM_FIRMWARE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true
# Flags
#BOARD_NO_SECURE_DISCARD := true

# GPS
TARGET_GPS_HAL_PATH := $(DEVICE_PATH)/gps
TARGET_NO_RPC := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
# /proc/partitions * 2 * BLOCK_SIZE (512) = size in bytes
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2684354560
BOARD_USERDATAIMAGE_PARTITION_SIZE := 11490278400 #-3072
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_PERSISTIMAGE_PARTITION_SIZE := 67108864
BOARD_FLASH_BLOCK_SIZE := 131072 # blockdev --getbsz /dev/block/mmcblk0p19

# Power
TARGET_POWERHAL_VARIANT := qcom
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(DEVICE_PATH)/power/power_ext.c

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Qualcomm support
BOARD_USES_QC_TIME_SERVICES := true
BOARD_USES_QCOM_HARDWARE := true

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)
#RECOVERY_VARIANT := twrp
ifneq ($(RECOVERY_VARIANT),twrp)
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/recovery.fstab
else
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/twrp.fstab
RECOVERY_GRAPHICS_FORCE_USE_LINELENGTH := true
DEVICE_RESOLUTION := 1920x1200
RECOVERY_SDCARD_ON_DATA := true
TW_NEW_ION_HEAP := true
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_TARGET_USES_QCOM_BSP := true
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "accelerometer\x0alis3dh-accel"
TARGET_RECOVERY_QCOM_RTC_FIX := true
BOARD_SUPPRESS_SECURE_ERASE := true
endif

# Release
#TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

#Release tools
#TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_federer
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# RIL
TARGET_RIL_VARIANT := caf

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/huawei/federer/sepolicy

# Vendor Init
TARGET_INIT_VENDOR_LIB := libinit_federer

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
BOARD_HAS_QCOM_WLAN     := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_HOSTAPD_DRIVER    := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn

BOARD_WLAN_DEVICE       := qcwcn

BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn

TARGET_USES_QCOM_WCNSS_QMI := true

WIFI_DRIVER_FW_PATH_AP  := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"

WPA_SUPPLICANT_VERSION  := VER_0_8_X

#TARGET_PROVIDES_WCNSS_QMI := true
#TARGET_USES_QCOM_WCNSS_QMI := true
TARGET_USES_WCNSS_CTRL  := true

# inherit from the proprietary version
-include vendor/huawei/federer/BoardConfigVendor.mk
