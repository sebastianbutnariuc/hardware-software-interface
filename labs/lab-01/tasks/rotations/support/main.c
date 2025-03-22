// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>

#include "rotate.h"

int main(void)
{
	unsigned int x = 17;

	rotate_right(&x, 2);
	rotate_left(&x, 3);
	return 0;
}
