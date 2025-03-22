// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "iterate.h"
#include "array.h"

void print_chars(void)
{
	unsigned char* p = (unsigned char *) v;

	for (int i = 0; i < 20; i++, p++) {
		printf("%p -> 0x%x\n", p, *p);
	}

	printf("-------------------------------\n");
}

void print_shorts(void)
{
	unsigned short* p = (unsigned short *) v;

	for (int i = 0; i < 10; i++, p++) {
		printf("%p -> 0x%x\n", p, *p);
	}

	printf("-------------------------------\n");
}

void print_ints(void)
{
	int* p = v;

	for (int i = 0; i < 5; i++, p++) {
		printf("%p -> 0x%x\n", p, *p);
	}

	printf("-------------------------------\n");
}
