CC=gcc
src=source/
bin=bin/


all: $(bin)ArbirtraryBase $(bin)arbitrary_base.so clean

$(bin):ArbirtraryBase $(src)
	$(CC) $(src)converter.c -o $(bin)ArbirtraryBase

$(bin)arbitrary_base.so: $(bin)oct_converter.o
	$(CC) $(bin)oct_converter.o -shared -o $(bin)lib_oct_converter.so 

$(bin)oct_converter.o: $(src)converter.c $(src)converter.h
	$(CC) -c $(src)converter.c -o $(bin)oct_converter.o -fPIC

clean:
	rm -f $(bin)*.o
