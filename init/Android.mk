LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := system/core/init
<<<<<<< HEAD
LOCAL_CFLAGS := -Wall -DANDROID_TARGET=\"$(TARGET_BOARD_PLATFORM)\"
LOCAL_SRC_FILES := init_federer.cpp
LOCAL_MODULE := libinit_federer
=======
LOCAL_CPPFLAGS := -Wall -DANDROID_TARGET=\"$(TARGET_BOARD_PLATFORM)\"
LOCAL_SRC_FILES := init_federer.cpp
LOCAL_MODULE := libinit_federer

>>>>>>> 1034efacafbf2fd700cf5144397d135d2148285e
include $(BUILD_STATIC_LIBRARY)
