// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <stdlib.h>

#include "pointers.h"

static int test_memcpy_overlap(void)
{
	char buffer[] = "abcdefghij";

	my_memcpy(buffer + 2, buffer, 5);

	return strncmp(buffer, "ababcdehij", 10) == 0 ? 1 : 0;
}

int main(void)
{
	char s1[] = "Abracadabra";
	char s2[] = "Abracababra";
	char src[] = "Learn HSI, you must!";

	char *dest_str = malloc(sizeof(src));
	char *dest_mem = malloc(sizeof(src));

	if (!dest_str || !dest_mem) {
		perror("malloc() failed");
		return 1;
	}

	(void) s1;
	(void) s2;

	/**
	 * Uncomment one assert at a time as you implement a function.
	 * If your function is implemented correctly, the assertion will succeed.
	 * Otherwise, the program will crash.
	 */
	/* assert(SIGN(my_strcmp(s1, s2)) == SIGN(strcmp(s1, s2))); */
	/* assert(my_strcpy(dest_str, src) && !strcmp(dest_str, src)); */
	/* assert(my_memcpy(dest_mem, src, sizeof(src)) && !memcmp(dest_mem, src, sizeof(src))); */
	test_memcpy_overlap();

	free(dest_str);
	free(dest_mem);
	return 0;
}
