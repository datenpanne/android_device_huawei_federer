LOCAL_32_BIT_ONLY := true
#LOCAL_MODULE_STEM_32 := true
LOCAL_MODULE_PATH_32 := true
TARGET_PREFER_32_BIT := true
#ifeq ($(TARGET_ARCH),$(filter $(TARGET_ARCH),arm arm64))
ifeq ($(TARGET_ARCH),$(filter $(TARGET_ARCH),arm))
  include $(call all-subdir-makefiles)
endif
