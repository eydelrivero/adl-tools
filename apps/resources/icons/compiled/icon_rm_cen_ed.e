note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class ICON_RM_CEN_ED

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/cen/ed"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(11,C0,C7,CE) A(00,B0,AE,AD) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(0E,1E,42,6E) 
					A(A3,6F,8E,B2) A(F4,6B,79,89) A(80,46,5F,7D) A(EA,62,88,B4) A(BA,2B,3E,57) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(67,69,86,AA) A(FF,8F,9C,AA) A(FE,68,77,8A) A(FF,50,75,A2) A(FE,5A,83,B4) A(FE,45,6C,9B) 
					A(FF,2C,49,6B) A(1F,6A,65,5F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(61,48,64,85) A(F9,67,73,82) 
					A(D3,4A,69,8E) A(FF,52,78,A7) A(FF,5A,80,AF) A(FF,6A,7F,99) A(FF,34,50,71) A(FF,40,68,97) A(FE,3C,61,8F) A(A1,29,3A,4E) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(8E,44,5D,7B) A(FF,56,78,A2) A(FF,56,7E,AE) A(FF,33,5B,8B) A(FF,DD,DD,DF) A(FF,B1,B1,B0) 
					A(FF,A4,A3,A3) A(FF,2B,47,68) A(FF,3F,66,94) A(FF,2A,45,65) A(10,AB,9C,8C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(47,6E,7C,8B) A(FF,32,57,84) A(FF,3E,65,93) A(FF,3A,5D,86) A(FF,C0,BD,B9) A(FF,B0,B0,B0) A(FF,B0,B0,AF) A(FF,39,4E,66) A(FF,3E,66,94) A(FF,3E,63,90) 
					A(99,1F,2E,3F) A(00,00,00,00) A(05,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(DF,40,5C,7E) A(FF,3F,65,94) A(FF,3A,60,8D) 
					A(FF,6D,76,82) A(FF,A8,A6,A3) A(FE,7D,7F,82) A(FE,36,5A,84) A(FF,36,54,77) A(D3,51,66,7E) A(44,88,98,AE) A(69,46,58,6E) A(8B,57,6A,82) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,5E,6E,81) A(5C,58,69,7E) A(FF,38,5E,8C) A(FF,3E,65,92) A(FF,3D,65,94) A(FE,3C,5C,83) A(FF,3B,57,78) A(B0,4C,5F,77) 
					A(36,AE,BC,CE) A(00,00,00,00) A(AC,44,57,6E) A(FF,34,56,80) A(7F,5C,6C,81) A(00,00,00,00) A(33,77,93,B5) A(18,4B,47,44) A(00,00,00,00) A(00,00,00,00) 
					A(EE,39,58,7C) A(FE,3E,62,8E) A(FF,3F,59,79) A(9E,4C,5F,77) A(08,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(CF,37,4D,69) A(FF,39,5E,8B) A(FF,3D,62,8D) 
					A(9B,60,71,86) A(CF,57,71,91) A(89,59,71,8E) A(09,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(68,5E,73,8C) A(98,5C,6D,83) A(03,FF,FF,FF) A(3A,6C,7A,8B) 
					A(FF,88,99,AE) A(FF,A7,B5,C6) A(FF,43,58,72) A(FD,4C,73,A3) A(FE,3E,65,93) A(FF,3D,62,8D) A(77,5A,6A,7E) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(37,58,6B,81) A(FF,94,99,A0) A(FF,AE,AD,AD) A(FF,3E,4F,64) A(FF,59,80,B0) 
					A(FF,3F,66,94) A(FF,3D,62,8D) A(CC,68,79,8D) A(FF,70,86,A1) A(FF,70,86,A2) A(64,85,90,9C) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(3B,60,72,87) A(FF,6C,76,82) A(FF,7B,82,89) A(FF,37,4A,61) A(FD,5D,85,B6) A(FE,3D,64,91) A(FF,3D,62,8D) A(77,58,68,7E) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(03,FF,FF,FF) A(10,FF,FF,FF) A(0F,FF,FF,FF) 
					A(09,FF,FF,FF) A(D3,57,78,A1) A(FF,56,7E,AF) A(FF,3B,60,8B) A(9B,64,73,87) A(DD,54,6E,8F) A(51,5A,77,9A) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,DD,DE,E2) A(00,00,00,00) A(AB,59,78,9E) A(FF,4F,75,A4) 
					A(7F,5A,6A,7E) A(00,00,00,00) A(79,55,6E,8C) A(30,99,9E,A4) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(72,64,82,A6) A(8B,60,75,8F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(04,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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