CROSSC := $(CROSS_COMPILE)gcc
FLAGS := -Wall -g
TARGET := writer
SRC := $(TARGET).c
OBJ := $(SRC:.c=.o)

#This is the default target
all: $(TARGET)

#Linking rules for the object files to create executable file
$(TARGET): $(OBJ)
	$(CROSSC) $(FLAGS) -o $@ $^

# Compile the source files into object files
%.o: %.c
	$(CROSSC) $(FLAGS) -c $< -o $@

#This is the clean target that removes compiled files and cleans the build files
clean:
	rm -f $(TARGET) $(OBJ)

.PHONY: clean
