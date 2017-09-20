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
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common OMNI stuff.
$(call inherit-product, vendor/cm/config/common_full.mk)

# TWRP
#PRODUCT_COPY_FILES += \
#    device/huawei/federer/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab


PRODUCT_NAME := cm_federer
BOARD_VENDOR := huawei

#PRODUCT_BUILD_PROP_OVERRIDES += \
#		BUILD_FINGERPRINT=HUAWEI/FDR/HWFDR:5.1.1/HuaweiMediaPad/FDR-A01LC170B002:user/release-keys \
#	    PRIVATE_BUILD_DESC="FDR-user 5.1.1 HuaweiMediaPad C170B002 release-keys" \

PRODUCT_GMS_CLIENTID_BASE := android-huawei
