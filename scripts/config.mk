define plat_conf
$(shell yq eval '. |= .global *+ .bin.$(PLATFORM)' $(CONFIG_FILE)
	| yq '... comments=""'
	| yq -r '.$(strip $1)')
endef

define spec_conf
$(shell rustc -Z unstable-options --print target-spec-json --target $(TARGET) | yq -r '.$(strip $1)')
endef

CONFIG_FILE  := byteos.yaml
PLATFORM     := 
TARGET       := $(call plat_conf,target)
ARCH         := $(call spec_conf,arch)
ROOT_FS      := $(call plat_conf,configs.root_fs)
export RUSTFLAGS := -Clink-arg=-no-pie
RUSTFLAGS    += 
# CONFIGS      := $(foreach key,$(call plat_conf,configs.[] | key),--cfg=$(subst :,=,$(key)))
CONFIGS      := $(shell  $(call plat_conf,configs))