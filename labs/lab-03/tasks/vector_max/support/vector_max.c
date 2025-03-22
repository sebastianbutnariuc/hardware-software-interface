// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "vector_max.h"

int vector_max(int *v, int len)
{
	int max = *v;
	unsigned int i = 1;

	start:

	if (i >= len) {
		goto end;
	}
	if (v[i] > max) {
		max = v[i];
	}
	i++;
	goto start;

	end:

	return max;
}
