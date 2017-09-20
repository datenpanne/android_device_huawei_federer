LOCAL_32_BIT_ONLY := true
TARGET_PREFER_32_BIT := true
#LOCAL_MODULE_STEM_32 := true
LOCAL_MODULE_PATH_32 := true
ifeq ($(TARGET_ARCH),$(filter $(TARGET_ARCH),arm arm64))
include $(call all-subdir-makefiles)
endif
