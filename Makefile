CFLAGS = -g -Wall -lm
CC = gcc

all: s01c01

s01c01: s01c01.c
		$(CC) $(CFLAGS) -o s01c01 s01c01.c

clean:
		rm -rf s01*
