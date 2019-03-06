void matrix_transpose(const int* inmatdata, int* outmatdata, int matorder) {
   /* Variables */
   int r, c; /* Row/column indices */
   /* Go through the matrix elements */
   for(r = 0; r < matorder; ++r) {
      for(c = 0; c < matorder; ++c) {
         outmatdata[c + r * matorder] = inmatdata[r + c * matorder];
      }
   }
}