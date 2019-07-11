# Copyright (C) 2014 The CyanogenMod Project
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

$(call inherit-product, device/huawei/federer/full_federer.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/lineage/config/telephony.mk)

# Inherit some common LineageOS stuff.
#$(call inherit-product, vendor/cm/config/common_full.mk)
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# TWRP
#PRODUCT_COPY_FILES += \
#    device/huawei/federer/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab


PRODUCT_NAME := lineage_federer
BOARD_VENDOR := huawei
PRODUCT_DEVICE := federer

PRODUCT_GMS_CLIENTID_BASE := android-huawei
