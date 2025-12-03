ASSEMBLER = nasm
CC = cc
LINKER = ld
ASSEMBLER_FLAGS = -f elf64
LINKER_FLAGS =
CFLAGS = -std=c99 -Wall -Wextra -Werror -MMD
INCLUDE = -I lib/criterion/include
LFLAGS = -lcriterion -L lib/criterion/lib -Wl,-rpath=lib/criterion/lib

SOURCE_BUILD_DIR = build/src
TEST_BUILD_DIR = build/test

MAIN_SOURCE_FILE = src/main.s
SOURCE_FILES = $(wildcard src/**/*.s)
TEST_FILES = $(wildcard test/**/*.c)

MAIN_OBJECT_FILE = build/src/main.o
SOURCE_OBJECT_FILES = $(patsubst src/%.s, $(SOURCE_BUILD_DIR)/%.o, $(SOURCE_FILES))
TEST_OBJECT_FILES = $(patsubst test/%.c, $(TEST_BUILD_DIR)/%.o, $(TEST_FILES))
DEPS_FILES = $(SOURCE_OBJECT_FILES:.o=.d)

MAIN_TARGET_BIN = build/main.out
TEST_TARGET_BIN = build/test.out
DOCKER_IMG = leetcode-x86_64-asm:1


.PHONY: all test test-verbose clean docker-build docker-run main

all: debug

main-run: $(MAIN_TARGET_BIN)
	@$(MAIN_TARGET_BIN)

test: $(TEST_TARGET_BIN)
	@$(TEST_TARGET_BIN)

test-verbose: $(TEST_TARGET_BIN)
	@$(TEST_TARGET_BIN) --verbose=0

clean:
	@$(RM) $(wildcard $(SOURCE_BUILD_DIR)/**/*)
	@$(RM) $(wildcard $(TEST_BUILD_DIR)/**/*)
	@$(RM) $(wildcard build/src/*.o)
	@$(RM) $(wildcard build/*.out)

docker-build:
	@sudo docker build -t $(DOCKER_IMG) .

docker-run:
	@sudo docker run -it --rm $(DOCKER_IMG)

main: $(MAIN_TARGET_BIN)

release: CFLAGS += -DNODEBUG
release: LFLAGS += -O3 -s
release: LINKER_FLAGS += -s
release: $(MAIN_TARGET_BIN) $(TEST_TARGET_BIN)

debug: ASSEMBLER_FLAGS += -g -F stabs
debug: LFLAGS += -O0
debug: $(MAIN_TARGET_BIN) $(TEST_TARGET_BIN)


-include $(DEPS_FILES)

$(SOURCE_BUILD_DIR)/%.o: src/%.s
	$(ASSEMBLER) $(ASSEMBLER_FLAGS) $< -o $@

$(MAIN_OBJECT_FILE): $(MAIN_SOURCE_FILE)
	$(ASSEMBLER) $(ASSEMBLER_FLAGS) $< -o $@

$(MAIN_TARGET_BIN): $(SOURCE_OBJECT_FILES) $(MAIN_OBJECT_FILE)
	$(LINKER) $^ -o $@

$(TEST_BUILD_DIR)/%.o: test/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

$(TEST_TARGET_BIN): $(SOURCE_OBJECT_FILES) $(TEST_OBJECT_FILES)
	$(CC) $(CFLAGS) $^ $(LFLAGS) -o $@


