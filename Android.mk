LOCAL_PATH := $(call my-dir)

bdroid_CFLAGS := -Wno-unused-parameter

# Setup bdroid local make variables for handling configuration
ifneq ($(BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR),)
  bdroid_C_INCLUDES := $(BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR)
  bdroid_CFLAGS += -DHAS_BDROID_BUILDCFG
else
  bdroid_C_INCLUDES :=
  bdroid_CFLAGS += -DHAS_NO_BDROID_BUILDCFG
endif

bdroid_CFLAGS += -Wall -Werror
bdroid_CFLAGS += -DAVK_BACKPORT

ifneq ($(BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED),)
  bdroid_CFLAGS += -DHCILP_INCLUDED=$(BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED)
endif

bdroid_CFLAGS += -Os

include $(call all-subdir-makefiles)

# Cleanup our locals
bdroid_C_INCLUDES :=
bdroid_CFLAGS :=

$(combo_2nd_arch_prefix)TARGET_NDK_GCC_VERSION := 4.8

LOCAL_CC := $$(TARGET_TOOLCHAIN_ROOT)/../arm-linux-androideabi-4.8/bin/arm-linux-androideabi-gcc$$(HOST_EXECUTABLE_SUFFIX)
LOCAL_CXX := $$(TARGET_TOOLCHAIN_ROOT)/../arm-linux-androideabi-4.8/bin/arm-linux-androideabi-g++$$(HOST_EXECUTABLE_SUFFIX)

