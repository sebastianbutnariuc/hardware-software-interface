// SPDX-License-Identifier: BSD-3-Clause

#include <stddef.h>

#include "pointers.h"

int my_strcmp(const char *s1, const char *s2)
{
	int i;
	for (i = 0; s1[i] != '\0' && s2[i] != '\0' && s1[i] == s2[i]; i++);

	if (s1[i] == '\0' && s2[i] == '\0') {
		return 0;
	}

	return s1[i] - s2[i];
}

void *my_memcpy(void *dest, const void *src, size_t n)
{
	unsigned char* d = (unsigned char*) dest;
	const unsigned char *s = (const unsigned char*) src;

	if (src < dest && dest < src + n) {
		for (size_t i = 0; i < n; i++) {
			d[n - i - 1] = s[n - i - 1];
		}
	} else {
		for (size_t i = 0; i < n; i++) {
			d[i] = s[i];
		}
	}

	return dest;
}

char *my_strcpy(char *dest, const char *src)
{
	char* p = dest;
	while(*src != '\0') {
		*(dest++) = *(src++);
	}
	*dest = '\0';
	return p;
}
