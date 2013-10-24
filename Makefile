# ==================================
# define our source and object files
# ==================================

OBJ_DIR= ./obj

SOURCES= Main.cpp Handy.cpp
OBJECTS= Main.o Handy.o
BUILT_OBJECTS= $(patsubst %,$(OBJ_DIR)/%,$(OBJECTS))

# ================
# compiler options
# ================

CXX= g++
CXXFLAGS= -Wall -O2 
PROG=  ComplexityByStartPos
LIBS= -L/usr/local/analysis/bamtools/2.3.0/lib -lbamtools -lz -L/usr/local/analysis/boost/1.54.0/lib
LDFLAGS = -Wl,-rpath /usr/local/analysis/bamtools/2.3.0/lib
INCLUDES = -I/usr/local/analysis/bamtools/2.3.0/include -I/usr/local/analysis/boost/1.54.0/include

# ================
# build targets
# ================

.PHONY: all
all: $(OBJ_DIR) $(PROG)

$(BUILT_OBJECTS): $(SOURCES)
	@$(CXX) -c -o $@ $(*F).cpp $(CXXFLAGS) $(INCLUDES)
   
ComplexityByStartPos: $(BUILT_OBJECTS)
	@$(CXX) $(LDFLAGS) $(CXXFLAGS) -o ComplexityByStartPos $(BUILT_OBJECTS) $(LIBS)

$(OBJ_DIR):
	@mkdir -p $@

.PHONY: clean
clean:
	@rm -f $(OBJ_DIR)/* $(PROG)
