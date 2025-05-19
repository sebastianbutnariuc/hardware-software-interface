// SPDX-License-Identifier: BSD-3-Clause

void set_price(int);
void print_price(void);
void print_quantity(void);
extern int qty;

int main(void)
{
	/*
	 * TODO: Make it so you print:
	 *    price is 21
	 *    quantity is 42
	 * without directly calling a printing function.
	 */
	set_price(21);
	qty = 42;
	print_price();
	print_quantity();

	return 0;
}
