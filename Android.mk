LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libOpenCL
LOCAL_SRC_FILES := opencl12_stubs.c
LOCAL_C_INCLUDES := $(LOCAL_PATH)/include $(LOCAL_PATH)/opencl12_stubs_include
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog -fPIE

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := GEMM/cmdoptions.cpp GEMM/gemm.cpp common/basic.cpp common/cmdparser.cpp common/oclobject.cpp
ifeq ($(TARGET_ARCH), $(filter $(TARGET_ARCH), arm arm64))
LOCAL_ARM_NEON := true
endif
LOCAL_MODULE := intel-gemm
LOCAL_C_INCLUDES := $(LOCAL_PATH)/common $(LOCAL_PATH)/opencl12_stubs_include
LOCAL_CPPFLAGS := -std=gnu++0x -Wall -fPIE
LOCAL_CPP_FEATURES := exceptions rtti
LOCAL_LDLIBS := -L$(SYSROOT)/usr/lib -llog -fPIE -pie
LOCAL_SHARED_LIBRARIES := libOpenCL

include $(BUILD_EXECUTABLE)
