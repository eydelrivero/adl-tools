note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class ICON_TOOL_SYNCHRONISE_INACTIVE

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "tool/synchronise_inactive"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,8F,A2,B7) A(FF,8B,9F,B3) A(FF,88,9B,B0) A(FF,84,98,AD) A(FF,81,94,AA) 
					A(FF,7F,92,A7) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,8D,9E,B1) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,94,A7,BC) 
					A(FF,95,A8,BC) A(FF,A0,B2,C3) A(FF,AE,BE,CD) A(FF,B2,C1,CF) A(FF,B2,C1,CE) A(FF,AE,BD,CB) A(FF,98,A9,B9) A(FF,7A,8D,A3) A(FF,78,8B,A0) A(FF,74,87,9D) 
					A(FF,8D,9E,B1) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,94,A7,BC) A(FF,9D,AF,C2) A(FF,BA,C9,D6) A(FF,BE,CC,D8) A(FF,C0,CE,D9) A(FF,C1,CF,D9) 
					A(FF,C3,D0,DA) A(FF,C4,D1,DA) A(FF,C5,D1,DB) A(FF,BB,C8,D3) A(FF,84,96,A9) A(FF,9D,AC,BB) A(FF,8D,9E,B1) A(00,00,00,00) A(00,00,00,00) A(FF,91,A5,BA) 
					A(FF,9C,AF,C1) A(FF,BC,CB,D8) A(FF,BE,CC,D8) A(FF,B9,C7,D4) A(FF,A0,B1,C1) A(FF,93,A5,B8) A(FF,91,A3,B5) A(FF,9D,AD,BD) A(FF,C0,CD,D7) A(FF,BF,CB,D5) 
					A(FF,B7,C4,CE) A(FF,AF,BC,C8) A(FF,8D,9E,B1) A(00,00,00,00) A(00,00,00,00) A(FF,92,A6,BA) A(FF,BA,C9,D6) A(FF,BE,CC,D8) A(FF,AB,BB,CA) A(FF,8C,9F,B3) 
					A(FF,86,99,AE) A(00,00,00,00) A(00,00,00,00) A(FF,7C,90,A5) A(FF,7E,91,A6) A(FF,B3,C0,CB) A(FF,AF,BC,C8) A(FF,A7,B5,C2) A(FF,8D,9E,B1) A(00,00,00,00) 
					A(FF,8B,9F,B4) A(FF,A1,B3,C4) A(FF,BE,CC,D8) A(FF,B9,C7,D4) A(FF,87,9B,B0) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,7A,8D,A3) 
					A(FF,9E,AE,BD) A(FF,AF,BC,C8) A(FF,A7,B5,C2) A(FF,A0,AE,BC) A(FF,8D,9E,B1) A(00,00,00,00) A(FF,88,9C,B1) A(FF,B1,C0,CE) A(FF,C0,CE,D9) A(FF,9B,AD,BE) 
					A(FF,85,99,AE) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(FF,8D,9E,B1) 
					A(FF,8D,9E,B1) A(00,00,00,00) A(FF,8B,9E,B1) A(FF,C1,CF,D9) A(FF,BC,CA,D6) A(FF,84,97,AD) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(FF,8D,9E,B1) 
					A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,8B,9E,B1) A(FF,C1,CF,D9) A(FF,BC,CA,D6) A(FF,84,97,AD) A(00,00,00,00) A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(FF,8D,9E,B1) 
					A(FF,8D,9E,B1) A(FF,8D,9E,B1) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,85,99,AE) A(FF,9B,AD,BE) A(FF,C0,CE,D9) A(FF,B1,C0,CE) A(FF,88,9C,B1) 
					A(00,00,00,00) A(FF,8D,9E,B1) A(FF,A0,AE,BC) A(FF,A7,B5,C2) A(FF,AF,BC,C8) A(FF,9E,AE,BD) A(FF,7A,8D,A3) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,87,9B,B0) A(FF,B9,C7,D4) A(FF,BE,CC,D8) A(FF,A1,B3,C4) A(FF,8B,9F,B4) A(00,00,00,00) A(FF,8D,9E,B1) A(FF,A7,B5,C2) A(FF,AF,BC,C8) 
					A(FF,B3,C0,CB) A(FF,7E,91,A6) A(FF,7C,90,A5) A(00,00,00,00) A(00,00,00,00) A(FF,86,99,AE) A(FF,8C,9F,B3) A(FF,AB,BB,CA) A(FF,BE,CC,D8) A(FF,BA,C9,D6) 
					A(FF,92,A6,BA) A(00,00,00,00) A(00,00,00,00) A(FF,8D,9E,B1) A(FF,AF,BC,C8) A(FF,B7,C4,CE) A(FF,BF,CB,D5) A(FF,C0,CD,D7) A(FF,9D,AD,BD) A(FF,91,A3,B5) 
					A(FF,93,A5,B8) A(FF,A0,B1,C1) A(FF,B9,C7,D4) A(FF,BE,CC,D8) A(FF,BC,CB,D8) A(FF,9C,AF,C1) A(FF,91,A5,BA) A(00,00,00,00) A(00,00,00,00) A(FF,8D,9E,B1) 
					A(FF,9D,AC,BB) A(FF,84,96,A9) A(FF,BB,C8,D3) A(FF,C5,D1,DB) A(FF,C4,D1,DA) A(FF,C3,D0,DA) A(FF,C1,CF,D9) A(FF,C0,CE,D9) A(FF,BE,CC,D8) A(FF,BA,C9,D6) 
					A(FF,9D,AF,C2) A(FF,94,A7,BC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,8D,9E,B1) A(FF,74,87,9D) A(FF,78,8B,A0) A(FF,7A,8D,A3) A(FF,98,A9,B9) 
					A(FF,AE,BD,CB) A(FF,B2,C1,CE) A(FF,B2,C1,CF) A(FF,AE,BE,CD) A(FF,A0,B2,C3) A(FF,95,A8,BC) A(FF,94,A7,BC) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,8D,9E,B1) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,7F,92,A7) A(FF,81,94,AA) A(FF,84,98,AD) A(FF,88,9B,B0) A(FF,8B,9F,B3) 
					A(FF,8F,A2,B7) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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