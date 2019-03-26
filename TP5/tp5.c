
#include <stdio.h>

unsigned int Decryption_fct(unsigned int le)
{
	unsigned int be;

	
	// Remplacez le code suivant par de l'assembleur en ligne
	// en utilisant le moins d'instructions possible 
	// be = (le & 0xff000000) | (le & 0xff) << 16  | (le & 0xff00) | (le & 0xff0000) >> 16;	

	asm volatile (
		/*"movl %1, %%ecx\n\t"			// %ecx = le = ee aa bb ff
		"andl $0x00ff00ff, %%ecx\n\t"	// %ecx = 00 aa 00 ff
		"rol $16, %%ecx\n\t"			// %ecx = 00 ff 00 aa
		"movl %1, %0\n\t"				// be = ee aa bb ff
		"andl $0xff00ff00, %0\n\t"		// be = ee 00 bb 00
		"orl %%ecx, %0\n\t"				// be = ee ff bb aa
		: "=r"(be)			// Pas de sorties
		: "r"(le)			// entrées
		: "ecx"		 		// registres modifiés
*/	
		"rol $8, %1\n\t"	// le = aa bb ff ee
		"bswap %1\n\t"		// le = ee ff bb aa
		"movl %1, %0\n\t"	// be = le		
		: "=r"(be)			// Sorties
		: "r"(le)			// Entrées
		:			 		// Registres modifiés
	);

	return be;
}

int main()
{
	unsigned int data = 0xeeaabbff;

	printf("Représentation crypte en little-endian:   %08x\n"
	       "Représentation decrypte en big-endian:    %08x\n",
	       data,
	       Decryption_fct(data));

	return 0;
}
