# Inherit AOSP device configuration for maguro.
$(call inherit-product, device/samsung/maguro/full_maguro.mk)

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

