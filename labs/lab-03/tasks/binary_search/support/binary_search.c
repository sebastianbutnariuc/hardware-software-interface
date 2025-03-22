// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "binary_search.h"

int binary_search(int *v, int len, int dest)
{
	int start = 0;
	int end = len - 1;
	int middle;

	start:

	if (end < start) {
		goto end;
	}
	middle = (start + end) / 2;
	if (v[middle] > dest) {
		goto before;
	}
	if (v[middle] < dest) {
		goto after;
	}
	if (v[middle] == dest) {
		return middle;
	}

	after:

	start = middle + 1;
	goto start;

	before:

	end = middle - 1;
	goto start;

	end:

	return -1;
}
