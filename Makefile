
PROJECT := InteropGen

CSC := mcs
BIN_DIR := bin
SRC_DIR := src

SOURCES := $(wildcard $(SRC_DIR)/*.cs)
EXECUTABLE := $(BIN_DIR)/$(PROJECT)

all: $(EXECUTABLE)

$(EXECUTABLE): $(SOURCES) $(BIN_DIR)
	$(CSC) /out:$(BIN_DIR)/$(PROJECT).exe $< 

$(BIN_DIR):
	mkdir bin

clean:
	rm -rf bin/*

xml:
	gccxml --gccxml-cxxflags `pkg-config --cflags elementary` /usr/include/elementary-1/* /usr/include/evas-1/* -fxml=elementary.xml
