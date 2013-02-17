note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class ICON_RM_OPENEHR_CAPABILITY

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/openehr/capability"
			make_with_size (16, 16)
			fill_memory
		end

feature {NONE} -- Image data
	
	c_colors_0 (a_ptr: POINTER; a_offset: INTEGER)
			-- Fill `a_ptr' with colors data from `a_offset'.
		external
			"C inline"
		alias
			"{
				{
					#define B(q) #q
					#ifdef EIF_WINDOWS
						#define A(a,r,g,b) B(\x##b\x##g\x##r\x##a)
					#else
						#define A(a,r,g,b) B(\x##r\x##g\x##b\x##a)
					#endif

					char l_data[] =
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(45,B3,C2,CB) A(73,AC,BD,C6) A(6A,D5,D9,DD) A(1C,FF,FF,FC) A(00,00,00,00) 
					A(00,EC,EC,EC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(59,A0,B7,C4) 
					A(FF,C4,D2,DA) A(FF,EB,EF,F2) A(FF,FF,FF,FF) A(FF,EB,F0,F3) A(FF,CF,D8,DE) A(B0,D8,DD,DF) A(00,00,00,00) A(00,EB,EB,EC) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(91,AA,BE,CA) A(FF,E6,EB,EF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FE,FE,FE) A(FF,FF,FF,FF) 
					A(FF,FF,FE,FD) A(FF,DB,E2,E7) A(A4,D8,DD,DF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,ED,F0,F3) A(35,A7,BD,CA) 
					A(FF,E4,EA,EE) A(FF,FE,FE,FE) A(FF,FE,FE,FE) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FD,FD,FD) A(FE,F5,F5,F4) A(FF,CF,D8,DD) A(30,FB,F5,F4) 
					A(00,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(AB,C7,D5,DC) A(FE,FF,FF,FF) A(FF,FE,FE,FE) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FE,FE,FE) A(FF,FF,FF,FF) A(FF,F0,F0,F0) A(FF,DF,E5,E7) A(73,DB,DE,E0) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(EB,DC,E5,EA) A(FF,FE,FE,FE) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,ED,ED,ED) 
					A(FF,F2,F1,F0) A(98,C0,CC,D3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(E1,DC,E4,EA) A(FF,F9,F9,F9) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FE,FE,FE) A(FF,FF,FF,FF) A(FF,E6,E6,E6) A(FF,EE,ED,EC) A(BA,CB,D4,DA) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(9A,BF,CF,D9) A(FE,F5,F3,F2) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FE,FE,FE) 
					A(FF,F9,F9,F9) A(FF,DC,DE,DD) A(FF,DF,DF,DE) A(F4,D9,E0,E4) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(0F,A4,BA,C7) 
					A(FF,D7,DF,E3) A(FF,E7,E7,E7) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,F6,F6,F6) A(FF,DD,DE,DD) A(FF,DD,DD,DC) A(FF,D8,D9,D8) A(FF,D7,DC,DF) 
					A(6F,E2,E3,E3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(42,AE,C1,CD) A(FF,DB,E1,E4) A(FE,DE,DE,DD) A(FF,DF,E0,DF) 
					A(FF,DC,DD,DC) A(FF,DC,DD,DC) A(FF,DC,DD,DC) A(FF,D8,D9,D8) A(FF,DB,DB,DB) A(FE,D0,D0,D0) A(FF,D8,DF,E3) A(27,FD,F6,F3) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(0F,8B,A9,B9) A(98,CC,D9,E0) A(FF,D8,E0,E4) A(FF,EC,EB,EB) A(FF,D9,DA,D9) A(FF,D6,D8,D7) A(FF,D2,D3,D3) 
					A(FF,E4,E4,E4) A(FE,F6,F6,F5) A(FF,B2,C7,D6) A(BD,C8,CE,D1) A(00,00,2E,85) A(00,EB,EC,EC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,FF,FF,FF) 
					A(00,00,00,00) A(00,00,00,00) A(60,B2,C6,D1) A(FF,E0,E4,E7) A(FE,D0,D0,D1) A(FF,CE,CF,CF) A(FF,D0,D0,CD) A(FF,A0,B2,BC) A(FE,41,5D,68) A(FF,53,7C,92) 
					A(86,E1,EC,F5) A(01,B0,DA,F3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,6D,93,A8) A(26,AF,C3,CF) 
					A(FF,DC,E2,E5) A(FE,D8,D8,D5) A(FE,72,83,8A) A(FF,3F,54,5B) A(FF,4D,68,76) A(FE,4A,68,75) A(F3,7C,9D,B0) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,BC,CD,D7) A(0E,92,B0,C1) A(C2,6A,7B,81) A(FF,37,47,49) A(FF,44,58,5F) 
					A(FF,45,5A,61) A(FE,4C,69,76) A(97,57,5B,54) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,96,9E,9D) A(05,D6,E8,F6) A(E9,4F,5E,5F) A(FE,38,49,4C) A(FE,3E,51,54) A(FF,3A,44,40) A(33,97,9C,9B) A(00,FF,FF,FF) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,8D,99,9B) 
					A(13,DC,DD,DB) A(8A,58,66,67) A(82,63,6C,6A) A(1D,93,97,96) A(00,00,00,00) A(00,00,00,00) ;
					memcpy ((EIF_NATURAL_32 *)$a_ptr + $a_offset, &l_data, sizeof l_data - 1);
				}
			}"
		end

	build_colors (a_ptr: POINTER)
			-- Build `colors'
		do
			c_colors_0 (a_ptr, 0)
		end

end