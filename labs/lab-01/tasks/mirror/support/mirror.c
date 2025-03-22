// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mirror.h"

void mirror(char *s)
{
	size_t length = strlen(s);

	for (size_t i = 0; i < (length) / 2; i++) {
		*(s + length - i - 1) = (*(s + i)) ^ (*(s + length - i - 1));
		*(s + i) = (*(s + i)) ^ (*(s + length - i - 1));
		*(s + length - i - 1) = (*(s + i)) ^ (*(s + length - i - 1));
	}
}
