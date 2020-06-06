# Required packages
PRODUCT_PACKAGES += \
    MatLog \
    OmniRecord \
    OmniStyle \
    ThemePicker \
    Gallery2 \
    AOSiPOverlayStub

ifeq ($(DERP_BUILD_ZIP_TYPE), VANILLA)
PRODUCT_PACKAGES += \
    LatinIME \
    messaging
endif

ifeq ($(filter-out Official CI Private, $(DERP_BUILDTYPE)),)
    PRODUCT_PACKAGES += \
        OpenDelta
endif

ifneq ($(DERP_BUILD_ZIP_TYPE), VANILLA)
PRODUCT_PACKAGES += \
    PixelLiveWallpaperPrebuilt
endif

# Extra tools in AOSiP
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    nano \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED := false
ifneq ($(TARGET_DISABLE_ALTERNATIVE_FACE_UNLOCK), true)
PRODUCT_PACKAGES += \
    FaceUnlockService
TARGET_FACE_UNLOCK_SUPPORTED := true
endif
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.moto_unlock_service=$(TARGET_FACE_UNLOCK_SUPPORTED)
