/*
   Copyright (c) 2016, The Linux Foundation. All rights reserved.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <android-base/logging.h>
#include <cstdlib>
#include <fstream>
#include <string>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

#include "init_msm8916.h"

using android::init::property_set;
using namespace std;

const char *APP_INFO = "/proc/app_info";

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

void property_override_dual(char const system_prop[], char const vendor_prop[], char const value[])
{
    property_override(system_prop, value);
    property_override(vendor_prop, value);
}

void set_model(const char *model) {
    property_override("ro.build.product", model);
    property_override_dual("ro.product.device", "ro.vendor.product.device", model);
    property_override_dual("ro.product.model", "ro.vendor.product.model", model);
}

void init_target_properties()
{
    ifstream fin;
    string buf;

    fin.open(APP_INFO, ios::in);
    if (!fin) {
        LOG(ERROR) << __func__ << ": Failed to open " << APP_INFO;
        return;
    }

    while (getline(fin, buf))
        if (buf.find("huawei_fac_product_name") != string::npos)
            break;
    fin.close();

    /* FDR-A01 */
    if (buf.find("FDR-A01L") != string::npos) {
        set_model("FDR-A01L");
        property_set("ro.telephony.default_network", "9");
        property_override("ro.build.description", "FDR-user 5.1.1 HuaweiMediaPad C100B006 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint",
                               "HUAWEI/FDR/HWFDR:5.1.1/HuaweiMediaPad/FDR-A01LC100B006:user/release-keys");
    }
    /* FDR-A01W */
    else if (buf.find("FDR-A01W") != string::npos) {
        set_model("FDR-A01W");
        property_set("ro.radio.noril" , "yes");
        property_override("ro.build.description", "FDR-user 5.1.1 HuaweiMediaPad C233B011 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint",
                               "HUAWEI/FDR/HWFDR:5.1.1/HuaweiMediaPad/FDR-A01wC233B011:user/release-keys");
    }
    /* FDR-A03 */
    else if (buf.find("FDR-A03L") != string::npos) {
        set_model("FDR-A03L");
        property_set("ro.telephony.default_network", "9");
        property_override("ro.build.description", "FDR-user 5.1.1 HuaweiMediaPadC233B010 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint",
                               "HUAWEI/FDR/HWFDR:5.1.1/HuaweiMediaPad/FDR-A03LC233B010:user/release-keys");
    }
    /* FDR-A04 Japan*/
    else if (buf.find("FDR-A04LC00") != string::npos) {
        set_model("HWT31");
        property_set("ro.telephony.default_network", "20");
        property_override("ro.build.description", "FDR-user 5.1.1 Federer C001B029 release-keys");
        property_override_dual("ro.build.fingerprint", "ro.vendor.build.fingerprint",
                               "Huawei/HWT31_jp_kdi/hwfdra04l:5.1.1/Federer/FDR-A04LC001B029:user/release-keys");
    }
    else {
        LOG(ERROR) << __func__ << ": unexcepted huawei_fac_product_name!";
    }
}
