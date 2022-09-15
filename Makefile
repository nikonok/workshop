BUILD_DIR?=build
COMPILER_CXX=g++

########### SECTION BEGIN
# Preprocessing section

PREPROCESSING_SRC_DIR?=lecture1/preprocessing
PREPROCESSING_BUILD_DIR?=$(BUILD_DIR)/$(PREPROCESSING_SRC_DIR)

$(PREPROCESSING_BUILD_DIR):
	@mkdir -p $(PREPROCESSING_BUILD_DIR)

.PHONY:preprocessing
preprocessing: $(PREPROCESSING_BUILD_DIR)
	@$(COMPILER_CXX) $(PREPROCESSING_SRC_DIR)/$(PREPRO_STEP).cpp $(PREPRO_OTHERS) -o $(PREPROCESSING_BUILD_DIR)/$(PREPRO_STEP)
	@$(COMMAND) $(PREPROCESSING_BUILD_DIR)/$(PREPRO_STEP)

.PHONY:p-conditions
p-conditions:
	@make preprocessing PREPRO_STEP=conditions --no-print-directory

.PHONY:p-replace
p-replace:
	@make preprocessing PREPRO_STEP=replace --no-print-directory

.PHONY:p-include
p-include: $(PREPROCESSING_BUILD_DIR)
	@make preprocessing PREPRO_STEP=include --no-print-directory

.PHONY:p-cause
p-cause:
	@make preprocessing PREPRO_STEP=cause --no-print-directory

.PHONY:p-pragma
p-pragma:
	@make preprocessing PREPRO_STEP=pragma COMMAND=cat PREPRO_OTHERS='-E' --no-print-directory

########### SECTION END

########### SECTION BEGIN
# Compilation section

COMPILATION_SRC_DIR?=lecture1/compilation
COMPILATION_BUILD_DIR?=$(BUILD_DIR)/$(COMPILATION_SRC_DIR)

$(COMPILATION_BUILD_DIR):
	@mkdir -p $(COMPILATION_BUILD_DIR)

.PHONY: compilation
compilation: $(COMPILATION_BUILD_DIR)
	@$(COMPILER_CXX) $(COMPILATION_SRC_DIR)/$(COMP_STEP).cpp $(COMP_OTHERS) -o $(COMPILATION_BUILD_DIR)/$(COMP_STEP)
	@$(COMMAND) $(COMPILATION_BUILD_DIR)/$(COMP_STEP)

.PHONY:c-intro
c-intro:
	@make compilation COMP_STEP=intro COMP_OTHERS=-S COMMAND=cat --no-print-directory

.PHONY:c-names
c-names:
	@make compilation COMP_STEP=names COMP_OTHERS=-S COMMAND=cat --no-print-directory

########### SECTION END

########### SECTION BEGIN
# Assembling section

ASSEMBLING_SRC_DIR?=lecture1/assembling
ASSEMBLING_BUILD_DIR?=$(BUILD_DIR)/$(ASSEMBLING_SRC_DIR)

$(ASSEMBLING_BUILD_DIR):
	@mkdir -p $(ASSEMBLING_BUILD_DIR)

.PHONY: assembling
assembling: $(ASSEMBLING_BUILD_DIR)
	@$(COMPILER_CXX) $(ASSEMBLING_SRC_DIR)/$(ASM_STEP).cpp $(ASM_OTHERS) -o $(ASSEMBLING_BUILD_DIR)/$(ASM_STEP)
	@$(COMMAND) $(ASSEMBLING_BUILD_DIR)/$(ASM_STEP)

.PHONY:a-main
a-main:
	@make assembling ASM_STEP=main ASM_OTHERS='-O0 -c' COMMAND='nm -C' --no-print-directory

########### SECTION END

.PHONY:clean
clean:
	rm -rf build
