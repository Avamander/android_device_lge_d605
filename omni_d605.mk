$(call inherit-product, vendor/omni/config/gsm.mk)
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, device/lge/d605/d605.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)


## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := d605
PRODUCT_NAME := omni_d605
PRODUCT_BRAND := LGE
PRODUCT_MODEL := LG-D605
PRODUCT_MANUFACTURER := lge
