#include <stdio.h>
#include <stdlib.h>

/* Modifiez ces définitions à votre guise afin de tester toutes les
conditions; elles correspondent aux valeurs initiales de a, b, c, d et e : */
#define INIT_A	-1000
#define INIT_B	-100
#define INIT_C	2000
#define INIT_D	-2500
#define INIT_E	1400

int a, b, c, d, e;

extern void func_s(void);

static void func_c(void) {
	int i;
	for (i=0; i<=10; i++){
		a = d + e - b;
		if ((b-1000) < (c+500)) {
			c = c - 500;
			if (b > c) {
				b = b - 500;
			}
		} else {
			b = b - e;
			d = d + 500;
		}
	}
}

int main(void) {
	a = INIT_A;
	b = INIT_B;
	c = INIT_C;
	d = INIT_D;
	e = INIT_E;

	printf("a = %d    b = %d    c = %d    d = %d    e = %d\n", a, b, c, d, e);
	printf("Le résultat devrait être le même les 3 fois :\n\n");
	func_c();
	printf("Version en langage C : %i\n", a);
	a = INIT_A;
	b = INIT_B;
	c = INIT_C;
	d = INIT_D;
	e = INIT_E;
	func_s();
	printf("Version en assembleur : %i\n", a);
	a = INIT_A;
	b = INIT_B;
	c = INIT_C;
	d = INIT_D;
	e = INIT_E;
	func_c();
	printf("Version en langage C : %i\n", a);

	return 0;
}
