# Makefile for dsPIC33-renode project

# Compiler and flags
MCS = mcs

# Directories
SRC_DIR = src
BUILD_DIR = build

# Source files
PROCESSOR_SRC = $(SRC_DIR)/cpu/DsPic33CPU.cs
PERIPHERAL_SRC = $(SRC_DIR)/peripherals/*.cs

# Output
OUT_DLL = $(BUILD_DIR)/dsPIC33-renode.dll

# Default target
all: $(OUT_DLL)

# Build target
$(OUT_DLL): $(PROCESSOR_SRC) $(PERIPHERAL_SRC)
	@mkdir -p $(BUILD_DIR)
	$(MCS) -target:library -out:$@ $^

# Clean target
clean:
	rm -rf $(BUILD_DIR)

run: $(OUT_DLL)
	renode scripts/dsPIC33.resc

# Phony targets
.PHONY: all clean
