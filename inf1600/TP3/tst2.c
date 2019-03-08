void matrix_multiply(const int* inmatdata1, const int* inmatdata2, int* outmatdata, int matorder) {
   /* Variables */
   int r, c; /* Row/column indices */
   int i;    /* Index for element calculation */
   int elem; /* Buffer for element calculation */
   /* Perform row x column multiplication */
   for(r = 0; r < matorder; ++r) {
      for(c = 0; c < matorder; ++c) {
         elem = 0;
         for(i = 0; i < matorder; ++i)
            elem += inmatdata1[i + r * matorder] * inmatdata2[c + i * matorder];
         outmatdata[c + r * matorder] = elem;
      }
   }
}
