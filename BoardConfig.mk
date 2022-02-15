# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2018 The LineageOS Project
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
#

DEVICE_PATH := device/huawei/federer

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

# inherit from common t2
-include device/huawei/t2-common/BoardConfigCommon.mk

# Camera
#BOARD_CAMERA_SENSORS := imx219_liteon_pad gc2355_ofilm_ohw2f03_pad ov8858_foxconn_pad ov2680_byd_bm2920b_pad

# Display
TARGET_SCREEN_DENSITY := 240

# FM
#AUDIO_FEATURE_ENABLED_FM := true
BOARD_HAVE_QCOM_FM := true
#AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
#TARGET_FM_LEGACY_PATCHLOADER := true

# HIDL
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

# Init
#TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/
#TARGET_INIT_VENDOR_LIB := libinit_federer
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_federer
TARGET_RECOVERY_DEVICE_MODULES := libinit_federer

# Kernel
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
TARGET_KERNEL_CONFIG := federer_defconfig

# Partitios
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 11618188288 

# inherit from the proprietary version
-include vendor/huawei/federer/BoardConfigVendor.mk
