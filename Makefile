ASSEMBLER = nasm
CC = cc
CFLAGS = -std=c99 -Wall -Wextra -Werror -MMD
ASSEMBLER_FLAGS = -f elf64
INCLUDE = -I lib/criterion/include
LFLAGS = -lcriterion -L:lib/criterion/lib/libcriterion.so

SOURCE_BUILD_DIR = build/src
TEST_BUILD_DIR = build/test

SOURCE_FILES = $(wildcard src/*.s)
TEST_FILES = $(wildcard test/*.c)

SOURCE_OBJECT_FILES = $(patsubst src/%.s,$(SOURCE_BUILD_DIR)/%.o,$(SOURCE_FILES))
TEST_OBJECT_FILES = $(patsubst test/%.c,$(TEST_BUILD_DIR)/%.o,$(TEST_FILES))
DEPS_FILES = $(SOURCE_OBJECT_FILES:.o=.d)

TEST_TARGET_BIN = build/test.elf


.PHONY: all test clean

all: debug

test: $(TEST_TARGET_BIN)
	@$(TEST_TARGET_BIN)

clean:
	$(RM) $(wildcard $(SOURCE_BUILD_DIR)/*)
	$(RM) $(wildcard $(TEST_BUILD_DIR)/*)
	$(RM) $(TEST_TARGET_BIN)


release: CFLAGS += -DNODEBUG
release: LFLAGS += -O3 -s
release: $(TEST_TARGET_BIN)

debug: ASSEMBLER_FLAGS += -g -F stabs
debug: LFLAGS += -O0
debug: $(TEST_TARGET_BIN)


-include $(DEPS_FILES)

$(SOURCE_BUILD_DIR)/%.o: src/%.s
	$(ASSEMBLER) $(ASSEMBLER_FLAGS) $< -o $@

$(TEST_BUILD_DIR)/%.o: test/%.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

$(TEST_TARGET_BIN): $(SOURCE_OBJECT_FILES) $(TEST_OBJECT_FILES)
	$(CC) $(CFLAGS) $^ $(LFLAGS) -o $@


