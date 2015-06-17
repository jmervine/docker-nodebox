IMAGE_BASE    := jmervine/nodebox
TAG_DIRS      := $(shell find -L . -type d | sed 's/^\.\///' | grep -v "^_\|^\.\|onbuild\|fat")
GEN_TARGETS   := $(addprefix generate/, $(TAG_DIRS))
BUILD_TARGETS := $(addprefix build/, $(TAG_DIRS))
PUSH_TARGETS  := $(addprefix push/, $(TAG_DIRS))
TEST_TARGETS  := $(addprefix test/, $(TAG_DIRS))

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
	cd $(subst build/,, $@); docker build --rm=true -t $(IMAGE_BASE):$(subst build/,,$@) .
	cd $(subst build/,, $@)/onbuild; docker build --rm=true -t $(IMAGE_BASE):$(subst build/,,$@)-onbuild .
	cd $(subst build/,, $@)/fat; docker build --rm=true -t $(IMAGE_BASE):$(subst build/,,$@)-fat .


$(PUSH_TARGETS):
	docker push $(IMAGE_BASE):$(subst push/,,$@)
	docker push $(IMAGE_BASE):$(subst push/,,$@)-onbuild
	docker push $(IMAGE_BASE):$(subst push/,,$@)-fat

parent: build/parent push/parent

build/parent:
	cd _nodebox-parent; docker build --rm=true --pull -t jmervine/nodebox-parent:latest .

push/parent:
	docker push jmervine/nodebox-parent:latest

test: $(TEST_TARGETS)

$(TEST_TARGETS):
	# testing $(subst test/,,$@)
	docker run --rm $(IMAGE_BASE):$(subst test/,,$@) node --version
	# testing $(subst test/,,$@)-onbuild
	docker run --rm $(IMAGE_BASE):$(subst test/,,$@)-onbuild node --version
