void matrix_row_aver(const int* inmatdata, int* outmatdata, int matorder) {
   /* Variables */
   int r, c; /* Row/column indices */
   int elem; /* Buffer for element calculation */
   /* Perform row x column multiplication */
   for(r = 0; r < matorder; ++r) {
	  elem = 0;
      for(c = 0; c < matorder; ++c) {
         elem += inmatdata[c + r * matorder];         
      }
	  outmatdata[r] = elem/matorder;
   }
}