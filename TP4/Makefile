CXX=g++
CFLAGS=-g -m32 -Wall
LDFLAGS=-lm
RM=rm -f
TARGET=tp4
OBJECTS=tp4.o triangle.o circle.o circle_perimeter.s circle_area.s triangle_perimeter.s triangle_area.s triangle_height.s

.PHONY: clean

.cpp.o:
	$(CXX) $(CFLAGS) -c -o $@ $<

.s.o:
	$(CXX) $(CFLAGS) -c -o $@ $<

all: tp4

$(TARGET): $(OBJECTS)
	$(CXX) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	$(RM) *.o $(TARGET)
