void ptr(int* adr1, int* adr2, int c, int r, int mat){
   
    adr1[c + r * mat] = adr2[r + c * mat];

}