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

#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include <iostream>
#include <fstream>
#include <string>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

using namespace std;

typedef struct {
    string model;
    string description;
    string fingerprint;
    bool is_noril;
} match_t;

void property_override(char const prop[], char const value[])
{
    prop_info *pi;

    pi = (prop_info*) __system_property_find(prop);
    if (pi)
        __system_property_update(pi, value, strlen(value));
    else
        __system_property_add(prop, strlen(prop), value, strlen(value));
}

static match_t matches[] = {
    /* FDR-A01 */
    {
        "FDR-A01L",
        "FDR-user 5.1.1 HuaweiMediaPad C100B006 release-keys",
        "HUAWEI/FDR/HWFDR:5.1.1/HuaweiMediaPad/FDR-A01LC100B006:user/release-keys",
        false
    },
    /* FDR-A01W */
    {
        "FDR-A01W",
        "FDR-user 5.1.1 HuaweiMediaPad C233B011 release-keys",
        "HUAWEI/FDR/HWFDR:5.1.1/HuaweiMediaPad/FDR-A01wC233B011:user/release-keys",
        true
    },
    /* FDR-A03 */
    {
        "FDR-A03L",
        "FDR-user 5.1.1 HuaweiMediaPadC233B010 release-keys",
        "HUAWEI/FDR/HWFDR:5.1.1/HuaweiMediaPad/FDR-A03LC233B010:user/release-keys",
        false
    },
};

static const int n_matches = sizeof(matches) / sizeof(matches[0]);

static void property_set(const char *key, string value)
{
    property_override(key, value.c_str());
}

static bool contains(string str, string substr)
{
    return str.find(substr) != string::npos;
}

void vendor_load_properties()
{
    string platform;
    string model;
    string hwsim;
    match_t *match;

    platform = property_get("ro.board.platform");
    if (platform != ANDROID_TARGET)
        return;

    ifstream app_info("/proc/app_info");
    if (app_info.is_open()) {
        while (getline(app_info, model) && !contains(model, "huawei_fac_product_name")) {
        }
        app_info.close();
    }

    for (match = matches; match - matches < n_matches && !contains(model, match->model); match++) {
    }

    if (!match) {
        WARNING("Unknown variant: %s", model.c_str());
        return;
    }

    property_set("ro.build.product", "federer");
    property_set("ro.product.device", "federer");
    property_set("ro.product.model", match->model);
    property_set("ro.build.description", match->description);
    property_set("ro.build.fingerprint", match->fingerprint);
    if (match->is_noril) {
        property_set("ro.radio.noril" , "yes");
    }
}
