// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "len_xor.h"

int my_strlen(const char *str)
{
	int i = 0;

	if (*(str + i) == '\0') {
		return 0;
	}

	do {
		i++;
	} while (*(str + i) != '\0');

	return i;
}

void equality_check(const char *str)
{
	int length = my_strlen(str);

	for (int i = 0; i < length; i++) {
		if (!(*(str + (i + (1 << i)) % length) ^ *(str + i))) {
			printf("Address of %c: %p\n", *(str + i), str + i);
		}
	}
}
