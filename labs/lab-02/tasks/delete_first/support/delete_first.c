// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "delete_first.h"

char *delete_first(char *s, char *pattern)
{
	char* p = strstr(s, pattern);

	if (!p) {
		return strdup(s);
	}

	char* copy = strdup(s);

	copy[p - s] = '\0';
	p = strdup(p + strlen(pattern));
	strcat(copy, p);

	return copy;
}
