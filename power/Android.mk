LOCAL_PATH := $(call my-dir)

# Hey Mr. Make Author, DIAF PLX
ifeq ($(TARGET_POWERHAL_VARIANT),federer)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true
LOCAL_SHARED_LIBRARIES := liblog libcutils libdl
LOCAL_SRC_FILES := power.c metadata-parser.c utils.c list.c hint-data.c power-8916.c

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
  LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

ifeq ($(TARGET_POWER_SET_FEATURE_LIB),)
  LOCAL_SRC_FILES += power-feature-default.c
else
  LOCAL_STATIC_LIBRARIES += $(TARGET_POWER_SET_FEATURE_LIB)
endif

ifneq ($(CM_POWERHAL_EXTENSION),)
LOCAL_MODULE := power.$(CM_POWERHAL_EXTENSION)
else
LOCAL_MODULE := power.$(TARGET_BOARD_PLATFORM)
endif
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

endif # TARGET_POWERHAL_VARIANT == qcom || WITH_QC_PERF
