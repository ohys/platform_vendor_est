LOCAL_PATH:=$(call my-dir)

define include-app
include $$(CLEAR_VARS)

LOCAL_MODULE := $$(basename $(notdir $(1)))
LOCAL_SRC_FILES := $(1)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $$(suffix $(1))
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
include $$(BUILD_PREBUILT)

endef

LOCAL_APPS += $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/gapps/system/app/*$(COMMON_ANDROID_PACKAGE_SUFFIX)))
LOCAL_APPS += $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/gapps/optional/face/app/*$(COMMON_ANDROID_PACKAGE_SUFFIX)))
LOCAL_APPS += Gmail.apk GoogleMaps.apk
ifneq ($(TARGET_ARCH),x86)
LOCAL_APPS += KoreanIME Superuser
endif

$(foreach a,$(LOCAL_APPS),$(eval $(call include-app,$(a))))
