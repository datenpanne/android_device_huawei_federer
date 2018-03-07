#!/sbin/sh
#
# Copyright (C) 2016 CyanogenMod Project
#
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
#    echo "ro.radio.noril=yes" >> /system/build.prop
#    rm -rf /system/etc/permissions/*telephony*
#    rm -rf /system/framework/*telephony*

MODEL=$ `cat /proc/app_info | grep huawei_fac_product_name`
WIFI_MODEL="HUAWEI FDR-A01W"

if [[ "$MODEL" = "$WIFI_MODEL" ]]
then
    # Remove Mobile
    rm -rf /system/app/Stk
    rm -rf /system/app/messaging
    rm -rf /system/app/qcrilmsgtunnel
    rm -rf /system/framework/*telecom*
    rm -rf /system/priv-app/CallLogBackup
    rm -rf /system/priv-app/CellBroadcastReceiver
    rm -rf /system/priv-app/Dialer
    rm -rf /system/priv-app/Telecom
    rm -rf /system/priv-app/MmsService
fi

