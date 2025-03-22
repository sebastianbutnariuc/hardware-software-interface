// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "mirror.h"

int main(void)
{
	char s[] = "Little-Endian";

	mirror(s);

	printf("%s\n", s);
	printf("%s\n", s + 7);

	return 0;
}
