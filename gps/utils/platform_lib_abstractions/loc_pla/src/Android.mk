GNSS_CFLAGS := \
    -Werror \
    -Wno-error=unused-parameter \
    -Wno-error=format \
    -Wno-error=macro-redefined \
    -Wno-error=reorder \
    -Wno-error=missing-braces \
    -Wno-error=self-assign \
    -Wno-error=enum-conversion \
    -Wno-error=logical-op-parentheses \
    -Wno-error=null-arithmetic \
    -Wno-error=null-conversion \
    -Wno-error=parentheses-equality \
    -Wno-error=undefined-bool-conversion \
    -Wno-error=tautological-compare \
    -Wno-error=switch \
    -Wno-error=date-time

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

## Libs
LOCAL_SHARED_LIBRARIES := \
    libutils \
    libcutils \
    liblog \
    libloc_stub

LOCAL_SRC_FILES += \
        platform_lib_gettid.cpp \
        platform_lib_log_util.cpp \
        platform_lib_property_service.cpp \
        platform_lib_sched_policy.cpp \
        platform_lib_time.cpp

LOCAL_CFLAGS += \
     -fno-short-enums \
     -D_ANDROID_ \
     -std=c++11

## Includes
LOCAL_C_INCLUDES:= \
    $(LOCAL_PATH)/../include
LOCAL_HEADER_LIBRARIES := \
    libgps.utils_headers \
    libloc_stub_headers

LOCAL_MODULE := libloc_pla
LOCAL_VENDOR_MODULE := true
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += $(GNSS_CFLAGS)
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libloc_pla_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/../include
include $(BUILD_HEADER_LIBRARY)
