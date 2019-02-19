.global func_s

func_s:
	flds e 
	flds g		#st[0]=g, st[1]=e
	fsubp		#st[0]=g-e
	flds f		#st[0]=f, st[1]=g-e
	fdivrp		#st[0]=(g-e)/f
	flds c
	flds b
	flds d		#st[0]=d, st[1]=b, st[2]=c, st[3]=(g-e)/f
	fmulp		#st[0]=b*d, st[1]=c, st[2]=(g-e)/f
	fsubp		#st[0]=(b*d)-c, st[1]=(g-e)/f
	flds g
	flds f		#st[0]=f, st[1]=g, st[2]=(b*d)-c ,st[3]=(g-e)/f
	fsubp		#st[0]=f-g, st[1]=(b*d)-c ,st[2]=(g-e)/f
	fdivrp		#st[0]=((b*d)-c)/(f-g), st[1]=(g-e)/f
	flds e		#st[0]=e, st[1]=((b*d)-c)/(f-g), st[2]=(g-e)/f
	faddp		#st[0]=e+((b*d)-c)/(f-g), st[1]=(g-e)/f
	fmulp		#st[0]=((g-e)/f)*(e+((b*d)-c)/(f-g))
	fstps a		#Le résultat du calcul est placé à l'adresse "a" et la pile est vide.

	ret
