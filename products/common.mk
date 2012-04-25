# Generic product
PRODUCT_NAME := est
PRODUCT_BRAND := est
PRODUCT_DEVICE := generic

PRODUCT_PACKAGES += \
	KoreanIME \
    Superuser \
	GoogleMaps \
	Gmail

# Blobs common to all devices
PRODUCT_COPY_FILES += \
    vendor/est/proprietary/su:system/xbin/su \
    vendor/est/proprietary/libjni_koreanime.so:system/lib/libjni_koreanime.so \
