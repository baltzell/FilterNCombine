.DELETE_ON_ERROR:

ROOTCONFIG := root-config
ROOTCFLAGS := $(shell $(ROOTCONFIG) --cflags)
ROOTLDFLAGS := $(shell $(ROOTCONFIG) --ldflags)
ROOTGLIBS := $(shell $(ROOTCONFIG) --glibs)

CXX := c++
LD := c++

CXXFLAGS := -g -O0 -Wall -fPIC $(ROOTCFLAGS) # O0
LDFLAGS := -g -O0 $(ROOTLDFLAGS) # O0

INCLUDES := -I$(PWD)
LIBS := $(ROOTGLIBS) -lEG -lMathMore -lMatrix -lSpectrum -lEG

PROG := FilterNCombine

.PHONY: all clean

all: $(PROG)

%: %.o
	@echo "Doing application" $@ 
	$(LD) $(LDFLAGS) $(LIBS) -o $@ $^

%.o: %.cxx
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(PROG:%=%.o) $(PROG)
