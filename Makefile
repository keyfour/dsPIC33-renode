# Makefile for dsPIC33 Renode plugin

# Compiler and flags
MCS = mcs

# Directories
SRC_DIR = src
BUILD_DIR = build
RENODE_LIB_DIR = /opt/renode/bin

# Source files
PROCESSOR_SRC = $(SRC_DIR)/cpu/DsPic33CPU.cs
PERIPHERAL_SRC = $(SRC_DIR)/peripherals/*.cs

# Libraries to reference
REFERENCES = \
	-r:$(RENODE_LIB_DIR)/Emulator.dll \
	-r:$(RENODE_LIB_DIR)/Renode-peripherals.dll \
	-r:$(RENODE_LIB_DIR)/ELFSharp.dll \
	-r:$(RENODE_LIB_DIR)/Migrant.dll \
	-r:$(RENODE_LIB_DIR)/Nini.dll

# Output
OUT_DLL = $(BUILD_DIR)/dsPIC33-renode.dll

# Default target
all: $(OUT_DLL)

# Build target
$(OUT_DLL): $(PROCESSOR_SRC) $(PERIPHERAL_SRC)
	@mkdir -p $(BUILD_DIR)
	$(MCS) -target:library -out:$@ $^ $(REFERENCES)

# Clean target
clean:
	rm -rf $(BUILD_DIR)

run: $(OUT_DLL)
	renode scripts/dsPIC33.resc

# Phony targets
.PHONY: all clean run
