# Boot animation
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# Inherit some common HEXA stuff.
$(call inherit-product, vendor/hexa/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/google/marlin/aosp_sailfish.mk)

-include device/google/marlin/sailfish/device-lineage.mk

# OTA Updater for Shamu
PRODUCT_PROPERTY_OVERRIDES += \
  ro.ota.romname=Hexa-Project-Sailfish \
  ro.ota.version=$(shell date -u +%Y%m%d) \
  ro.ota.manifest=https://raw.githubusercontent.com/Hexa-Project/release_sailfish/master/ota.xml

## Device identifier. This must come after all inclusions
PRODUCT_NAME := hexa_sailfish
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel
TARGET_MANUFACTURER := HTC
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=sailfish \
    BUILD_FINGERPRINT="google/sailfish/sailfish:7.1.1/NMF26Q/3537182:user/release-keys" \
    PRIVATE_BUILD_DESC="sailfish-user 7.1.1 NMF26Q 3537182 release-keys"

$(call inherit-product-if-exists, vendor/google/marlin/marlin-vendor.mk)
