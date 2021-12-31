# OrangeFox Zone
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export LC_ALL="C"
export OF_PATCH_AVB20=1
export OF_AB_DEVICE=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1
export FOX_REPLACE_TOOLBOX_GETPROP=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_SED_BINARY=1
export FOX_USE_BASH_SHELL=1
export OF_DONT_PATCH_ENCRYPTED_DEVICE=1
export OF_KEEP_DM_VERITY_FORCED_ENCRYPTION=1
export OF_SKIP_FBE_DECRYPTION=1
export OF_OTA_RES_DECRYPT=1
export OF_MAINTAINER="Beru Shinsetsu (Upstr. Redmi-MT6768)"
export OF_SCREEN_H="2220"
export OF_STATUS_INDENT_LEFT="48"
export OF_STATUS_INDENT_RIGHT="48"
export OF_HIDE_NOTCH=1
export OF_CLOCK_POS=1
export OF_ALLOW_DISABLE_NAVBAR=0
export TARGET_DEVICE_ALT="lancelot, galahad, lava"
export OF_TARGET_DEVICES="lancelot, galahad, lava"
export OF_CHECK_OVERWRITE_ATTEMPTS=1
export OF_FIX_OTA_UPDATE_MANUAL_FLASH_ERROR=1
export OF_OTA_BACKUP_STOCK_BOOT_IMAGE=1
export OF_NO_SAMSUNG_SPECIAL=1
export FOX_USE_SPECIFIC_MAGISK_ZIP="device/xiaomi/lancelot/magisk/Magisk-v23.0.zip"
export OF_ENABLE_LPTOOLS=1

# Clone GUI repo if doesn't exist (Utilizes OFOX one)
if [ ! -d bootable/recovery/gui/theme ]; then
    echo ""
    echo "Theme repo is missing, which will cause build to fail. Cloning from OFOX..."
    echo ""
    git clone https://gitlab.com/OrangeFox/misc/theme.git \
    -b master \
    --depth=1 \
    bootable/recovery/gui/theme
    echo ""
fi

if [ ! -d bootable/recovery/gui/theme/portrait_hdpi ]; then
    echo ""
    echo "Theme repo folder exists, but doesn't contain the one we need. Removing the folder and cloning from OFOX..."
    echo ""
    echo "Removing bootable/recovery/gui/theme ..." && \
    rmdir bootable/recovery/gui/theme && \
    echo "" && \
    git clone https://gitlab.com/OrangeFox/misc/theme.git \
    -b master \
    --depth=1 \
    bootable/recovery/gui/theme && \
    echo "" || echo "Removal failed, you need to get the repo yourself. Check the recovery's building documentation for more info."
fi
