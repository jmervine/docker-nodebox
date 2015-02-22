IMAGE_BASE    := jmervine/docker-nodebox
TAG_DIRS      := $(shell find . -type d | sed 's/^\.\///' | grep -v "_common\|^\.\|onbuild")
GEN_TARGETS   := $(addprefix generate/, $(TAG_DIRS))
BUILD_TARGETS := $(addprefix build/, $(TAG_DIRS)) build/latest
PUSH_TARGETS  := $(addprefix push/, $(TAG_DIRS)) push/latest

versions:
	@echo "Versions:"
	@echo "---------"
	@echo " $(addsuffix \\n,$(TAG_DIRS))"

generate: $(GEN_TARGETS)
build:    $(BUILD_TARGETS)
push:     $(PUSH_TARGETS)

$(GEN_TARGETS):
	python generate.py --tag $(subst generate/,,$@)

$(BUILD_TARGETS):
	cd $(subst build/,, $@); sudo docker build --pull -t $(IMAGE_BASE):$(subst build/,,$@) .
	cd $(subst build/,, $@)/onbuild; sudo docker build --pull -t $(IMAGE_BASE):$(subst build/,,$@)-onbuild .

$(PUSH_TARGETS):
	docker push $(IMAGE_BASE):$(subst push/,, $@)
	docker push $(IMAGE_BASE):$(subst push/,, $@)-onbuild

