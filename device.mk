#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
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

# Inherit from t2-common
$(call inherit-product, device/huawei/t2-common/t2.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

#PRODUCT_ENFORCE_RRO_TARGETS := *

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += device/huawei/federer

# Audio calibration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/acdb/workspaceFile.qwsp:system/etc/workspaceFile.qwsp \
    $(LOCAL_PATH)/audio/acdb/Bluetooth_cal.acdb:system/etc/QRD_Bluetooth_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Bluetooth_cal_ce.acdb:system/etc/Bluetooth_cal_ce.acdb \
    $(LOCAL_PATH)/audio/acdb/General_cal.acdb:system/etc/QRD_General_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/General_cal_ce.acdb:system/etc/QRD_General_cal_ce.acdb \
    $(LOCAL_PATH)/audio/acdb/Global_cal.acdb:system/etc/QRD_Global_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Global_cal_ce.acdb:system/etc/QRD_Global_cal_ce.acdb \
    $(LOCAL_PATH)/audio/acdb/Handset_cal.acdb:system/etc/QRD_Handset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Handset_cal_ce.acdb:system/etc/QRD_Handset_cal_ce.acdb \
    $(LOCAL_PATH)/audio/acdb/Hdmi_cal.acdb:system/etc/QRD_Hdmi_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Hdmi_cal_ce.acdb:system/etc/QRD_Hdmi_cal_ce.acdb \
    $(LOCAL_PATH)/audio/acdb/Headset_cal.acdb:system/etc/QRD_Headset_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Headset_cal_ce.acdb:system/etc/QRD_Headset_cal_ce.acdb \
    $(LOCAL_PATH)/audio/acdb/Speaker_cal.acdb:system/etc/QRD_Speaker_cal.acdb \
    $(LOCAL_PATH)/audio/acdb/Speaker_cal_ce.acdb:system/etc/QRD_Speaker_cal_ce.acdb

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths_skuk.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_skuk.xml


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/calib_fdr.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/calib_fdr.cfg

# Doze
#PRODUCT_PACKAGES += \
#   FedererDoze

# Gatekeeper
#PRODUCT_PACKAGES += \
#    gatekeeper.msm8916 \
#    android.hardware.gatekeeper@1.0-impl \
#    android.hardware.gatekeeper@1.0-service


# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera.display.umax=1920x1080 \
    camera.display.lmax=1280x720

# FM
PRODUCT_PACKAGES += \
    FM2 \
    libqcomfm_jni \
    qcom.fmradio \
    init.qti.fm.sh
#    FMRadio \     FMRecord \
#    libfmjni

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/cyttsp5_mt.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/cyttsp5_mt.kl \
    $(LOCAL_PATH)/keylayout/goodix.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodix.kl \
    $(LOCAL_PATH)/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl

# Sensors HAL
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl \
    libcalmodule_common \
    calmodule.cfg \
    sensors.msm8916

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:$(TARGET_COPY_OUT_VENDOR)/etc/thermal-engine.conf

# Call the proprietary setup
$(call inherit-product, vendor/huawei/federer/federer-vendor.mk)
