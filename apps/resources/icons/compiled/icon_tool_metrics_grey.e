note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class ICON_TOOL_METRICS_GREY

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "tool/metrics_grey"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,29,29,29) A(FF,86,86,86) A(FF,DC,DC,DC) A(FF,F3,F3,F3) 
					A(FF,F3,F3,F3) A(FF,DC,DC,DC) A(FF,86,86,86) A(FF,29,29,29) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,7A,7A,7A) A(FF,E1,E1,E1) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,E0,E0,E0) 
					A(FF,7B,7B,7B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,4D,4D,4D) A(FF,D7,D7,D7) A(FF,FF,FF,FF) A(FF,00,00,00) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,E2,E2,E2) A(FF,FF,FF,FF) A(FF,D6,D6,D6) A(FF,47,47,47) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,A6,A6,A6) A(FF,F6,F6,F6) A(FF,D5,D5,D5) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) 
					A(FF,CF,CF,CF) A(FF,D5,D5,D5) A(FF,F6,F6,F6) A(FF,A5,A5,A5) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,48,48,48) A(FF,C0,C0,C0) A(FF,D8,D8,D8) 
					A(FF,CB,CB,CB) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,CB,CB,CB) A(FF,CB,CB,CB) A(FF,D8,D8,D8) A(FF,C0,C0,C0) 
					A(FF,47,47,47) A(00,00,00,00) A(00,00,00,00) A(FF,44,44,44) A(FF,CC,CC,CC) A(FF,C8,C8,C8) A(FF,C8,C8,C8) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,C8,C8,C8) A(FF,C8,C8,C8) A(FF,C8,C8,C8) A(FF,CC,CC,CC) A(FF,44,44,44) A(00,00,00,00) A(00,00,00,00) A(FF,40,40,40) 
					A(FF,C8,C8,C8) A(FF,C3,C3,C3) A(FF,C3,C3,C3) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,C3,C3,C3) A(FF,C3,C3,C3) 
					A(FF,C3,C3,C3) A(FF,C8,C8,C8) A(FF,40,40,40) A(00,00,00,00) A(00,00,00,00) A(FF,3B,3B,3B) A(FF,BC,BC,BC) A(FF,BD,BD,BD) A(FF,BD,BD,BD) A(FF,00,00,00) 
					A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,BD,BD,BD) A(FF,BD,BD,BD) A(FF,BD,BD,BD) A(FF,BD,BD,BD) A(FF,3B,3B,3B) A(00,00,00,00) 
					A(00,00,00,00) A(FF,36,36,36) A(FF,A1,A1,A1) A(FF,BC,BC,BC) A(FF,B5,B5,B5) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,B5,B5,B5) A(FF,B5,B5,B5) A(FF,BC,BC,BC) A(FF,A1,A1,A1) A(FF,36,36,36) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,73,73,73) A(FF,C4,C4,C4) 
					A(FF,AF,AF,AF) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,AB,AB,AB) A(FF,B0,B0,B0) A(FF,C4,C4,C4) A(FF,72,72,72) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,2F,2F,2F) A(FF,91,91,91) A(FF,CA,CA,CA) A(FF,00,00,00) A(FF,FF,FF,FF) A(FF,FF,FF,FF) 
					A(FF,FF,FF,FF) A(FF,FF,FF,FF) A(FF,AD,AD,AD) A(FF,CA,CA,CA) A(FF,91,91,91) A(FF,29,29,29) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,3E,3E,3E) A(FF,8C,8C,8C) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,00,00,00) A(FF,D6,D6,D6) A(FF,8C,8C,8C) 
					A(FF,3E,3E,3E) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,0C,0C,0C) A(FF,32,32,32) 
					A(FF,75,75,75) A(FF,91,91,91) A(FF,90,90,90) A(FF,75,75,75) A(FF,32,32,32) A(FF,0B,0B,0B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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