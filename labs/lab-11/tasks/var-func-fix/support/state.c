// SPDX-License-Identifier: BSD-3-Clause

#include <string.h>

char *init_shopping[3];

void shopping_list(void)
{
	init_shopping[0] = strdup("cheese");
	init_shopping[1] = strdup("wine");
	init_shopping[2] = strdup("dessert");
}
