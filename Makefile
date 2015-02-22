IMAGE_BASE    := jmervine/docker-nodebox
TAG_DIRS      := $(shell find . -type d | sed 's/^\.\///' | grep -v "_common\|^\.\|onbuild")
GEN_TARGETS   := $(addprefix generate/, $(TAG_DIRS))
BUILD_TARGETS := $(addprefix build/, $(TAG_DIRS)) build/latest

versions:
	@echo "Versions:"
	@echo "---------"
	@echo " $(addsuffix \\n,$(TAG_DIRS))"

generate: $(GEN_TARGETS)

# for testing only
build:    $(BUILD_TARGETS)

$(GEN_TARGETS):
	python generate.py --tag $(subst generate/,,$@)

$(BUILD_TARGETS):
	cd $(subst build/,, $@); sudo docker build --pull -t $(IMAGE_BASE):$(subst build/,,$@) .
	cd $(subst build/,, $@)/onbuild; sudo docker build --pull -t $(IMAGE_BASE):$(subst build/,,$@)-onbuild .
