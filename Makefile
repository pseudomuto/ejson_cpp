.PHONY: build clean cmake run test

BUILD_TYPE ?= Debug
BUILD_DIR ?= cmake-build-$(shell echo $(BUILD_TYPE) | tr '[:upper:]' '[:lower:]')

CODECOV ?= OFF
IWYU ?= ON

build: cmake
	@cd $(BUILD_DIR) && make ejson -j 4

clean:
	@rm -rf $(BUILD_DIR)

cmake:
	@mkdir -p $(BUILD_DIR) && cd $(BUILD_DIR) && cmake -DIWYU=$(IWYU) -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -DCODE_COVERAGE=$(CODECOV) -j 4 ..

run:
	@$(BUILD_DIR)/bin/ejson $(ARGS)

test:
	@cd $(BUILD_DIR) && make tests CMAKE_BUILD_TYPE=$(BUILD_TYPE) test CTEST_OUTPUT_ON_FAILURE=TRUE

coverage: test
	@cd $(BUILD_DIR) && make codecov CMAKE_BUILD_TYPE=$(BUILD_TYPE)
