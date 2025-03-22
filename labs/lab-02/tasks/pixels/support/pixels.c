// SPDX-License-Identifier: BSD-3-Clause

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <time.h>

#include "pixel.h"
#include "pixels.h"

void reverse_pic(struct picture *pic)
{
	for (int i = 0; i < (pic->height + 1)/ 2; i++) {
		for (int j = 0; j < pic->width; j++) {
			struct pixel temp = pic->pix_array[i][j];
			pic->pix_array[i][j] = pic->pix_array[pic->height - i - 1][j];
			pic->pix_array[pic->height - i - 1][j] = temp;
		}
	}
}

void color_to_gray(struct picture *pic)
{
	for (int i = 0; i < pic->height; i++) {
		for (int j = 0; j < pic->width; j++) {
			pic->pix_array[i][j].R *= 0.3;
			pic->pix_array[i][j].G *= 0.59;
			pic->pix_array[i][j].B *= 0.11;
		}
	}
}
