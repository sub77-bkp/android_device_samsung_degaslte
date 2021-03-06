#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# inherit from common smdk3470
-include device/samsung/smdk3470-common/BoardConfigCommon.mk

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),userdebug)
   ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
   endif
  endif
endif

# Assert
TARGET_OTA_ASSERT_DEVICE := degasltexx,degaslte,T235,T235Y

# Filesystems
# Note: the BOARD_...IMAGE_PARTITION_SIZE values define the image sizes, 
# not the partition sizes. So the image sizes can also be lower than the partition size. 

# Real partition sizes
#BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
#BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2233466880
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 5044699136????(-16384)

# Image sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 10485760
BOARD_CACHEIMAGE_PARTITION_SIZE := 209715200
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 12582912
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648

# Include path
TARGET_SPECIFIC_HEADER_PATH += device/samsung/degaslte/include

# Kernel
TARGET_KERNEL_CONFIG := degaslte_00_defconfig
TARGET_KERNEL_SOURCE := kernel/samsung/degaslte

# CMHW
BOARD_HARDWARE_CLASS := device/samsung/degaslte/cmhw

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/degaslte/bluetooth

# NFC
# Chipset: no NFC

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += device/samsung/degaslte
TARGET_RECOVERY_FSTAB := device/samsung/degaslte/rootdir/etc/fstab.universal3470

# PowerHAL
TARGET_POWERHAL_VARIANT := exynos3

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# SELinux
BOARD_SEPOLICY_DIRS += \
   device/samsung/degaslte/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    service_contexts \
    device.te \
    domain.te \
    drmserver.te \
    file.te \
    gpsd.te \
    init.te \
    mediaserver.te \
    servicemanager.te \
    system_app.te \
    system_server.te \
    vold.te \
    wpa.te

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_degaslte
TARGET_LIBINIT_DEFINES_FILE := device/samsung/gardalte/init/init_degaslte.c

# TWRP
DEVICE_RESOLUTION := 800x1280
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_DOWNLOAD_MODE := true
