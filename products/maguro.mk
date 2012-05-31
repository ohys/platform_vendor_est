# Inherit AOSP device configuration for maguro.
$(call inherit-product-if-exists, device/samsung/maguro/full_maguro.mk)

# Inherit common product files.
$(call inherit-product, vendor/est/products/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := est_maguro
PRODUCT_BRAND := Android
PRODUCT_DEVICE := maguro
#PRODUCT_MODEL := Galaxy Nexus
#PRODUCT_MANUFACTURER := samsung

# Inherit common build.prop overrides
-include vendor/est/products/common_versions.mk

# Inherit gapps blobs
-include vendor/est/products/gapps_ics.mk
-include vendor/est/products/gapps_optional_ics.mk


PRODUCT_PACKAGES += \
	KoreanIME \
    Superuser

PRODUCT_COPY_FILES += \
    vendor/est/proprietary/bin/armeabi/su:system/xbin/su \
    vendor/est/proprietary/lib/armeabi/libjni_koreanime.so:system/lib/libjni_koreanime.so
