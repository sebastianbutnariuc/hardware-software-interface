// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <limits.h>

#include "rotate.h"

void rotate_left(unsigned int *number, int bits)
{
	unsigned int mask = ~(1 << ( 32 - bits - 1));
	mask = *number & mask;
	mask = mask >> (32 - bits);
	*number = *number << bits;
	*number = *number | mask;
}

void rotate_right(unsigned int *number, int bits)
{
	unsigned int mask = (1 << bits) - 1;
	mask = *number & mask;
	mask = mask << (32 - bits);
	*number = *number >> bits;
	*number = *number | mask;
}
