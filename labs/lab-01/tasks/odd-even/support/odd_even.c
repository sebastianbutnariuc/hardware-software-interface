// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>

#include "odd_even.h"

void print_binary(int number, int nr_bits)
{
	int  s[33];
	int i = 0;

	for (i = 0; i < nr_bits; i++) {
		s[i] = number & 1;
		number = number >> 1;
	}

	int n = i;
	printf("0b");

	for (i = 0; i < n; i++) {
		printf("%d", s[n - i - 1]);
	}
	printf("\n");
}

void check_parity(int *numbers, int n)
{
	/* TODO */
	// (void) numbers;
	// (void) n;

	for (int i = 0; i < n; i++) {
		if (numbers[i] % 2) {
			printf("0x%08X\n", numbers[i]);
		} else {
			print_binary(numbers[i], 8);
		}
	}
}
