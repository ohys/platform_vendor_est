# Inherit AOSP device configuration for maguro.
$(call inherit-product-if-exists, device/asus/eeepc_x101/eeepc.mk)

# Inherit common product files.
$(call inherit-product, vendor/est/products/common.mk)

# Setup device specific product configuration.
PRODUCT_NAME := est_eeepc_x101
PRODUCT_BRAND := Android
PRODUCT_DEVICE := eeepc_x101

# Inherit common build.prop overrides
-include vendor/est/products/common_versions.mk

# Inherit gapps blobs
-include vendor/est/products/gapps_ics.mk

