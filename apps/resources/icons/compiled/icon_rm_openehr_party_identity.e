note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class ICON_RM_OPENEHR_PARTY_IDENTITY

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/openehr/party_identity"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,64,63,63) A(FF,57,56,55) A(FF,FF,FF,FF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,BF,C1,C7) A(FF,57,55,52) 
					A(FF,4C,47,44) A(FF,32,2E,2C) A(FF,23,20,1F) A(FF,6B,6A,6A) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,52,50,4E) A(FF,45,42,40) A(FF,3F,3C,3B) A(FF,2B,29,27) A(FF,14,14,14) A(FF,34,2F,2D) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,3F,3B,3A) A(FF,7E,6A,58) A(FF,CB,AE,8E) A(FF,AC,8A,69) A(FF,A0,6A,3D) A(FF,9F,46,14) A(FF,A3,98,A6) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,50,44,3A) A(FF,6D,59,44) A(FF,D8,A9,7C) A(FF,CD,95,63) 
					A(FF,B2,6B,34) A(FF,9D,4A,19) A(FF,87,4F,42) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,82,59,43) A(FF,BB,6F,35) A(FF,BA,7A,43) A(FF,B3,6D,36) A(FF,A1,52,20) A(FF,9B,4C,23) A(FF,FF,FF,FF) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,91,46,27) 
					A(FF,9B,47,18) A(FF,96,44,16) A(FF,9F,49,17) A(FF,A3,68,44) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,EB,A3,54) A(FF,FE,B9,5D) A(FF,C5,A6,97) A(FF,A2,7F,78) A(FF,6B,5E,A4) A(FF,CC,96,62) 
					A(FF,98,4B,0F) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,E7,9A,4A) 
					A(FF,FA,A1,30) A(FF,FA,BA,64) A(FF,F6,B0,52) A(FF,EC,F2,EE) A(FF,5F,58,C9) A(FF,DB,B7,85) A(FF,A0,46,00) A(FF,A1,63,34) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,EF,A1,45) A(FF,FC,A6,39) A(FF,F8,A8,43) A(FF,FF,AC,3F) A(FF,F9,B9,69) 
					A(FF,60,60,CB) A(FF,99,79,89) A(FF,A2,47,00) A(FF,9C,53,1B) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,E6,F8,FF) A(FF,F0,88,12) A(FF,FA,9E,2C) A(FF,F3,8E,1A) A(FF,E3,7E,10) A(FF,FD,82,00) A(FF,6E,51,84) A(FF,44,2D,7B) A(FF,9F,45,00) A(FF,6E,5B,54) 
					A(FF,3B,57,78) A(FF,5A,7E,A8) A(FF,5D,7F,A8) A(FF,4F,72,9D) A(FF,63,80,A5) A(00,00,00,00) A(FF,D5,DA,DF) A(FF,F4,75,00) A(FF,F9,86,09) A(FF,F9,85,08) 
					A(FF,E5,72,00) A(FF,D0,66,01) A(FF,C5,61,0A) A(FF,2C,20,82) A(FF,8C,3A,00) A(FF,53,56,64) A(FF,20,34,4E) A(FF,3B,61,8F) A(FF,4B,62,7E) A(FF,64,7C,9B) 
					A(FF,3F,5F,86) A(FF,45,5C,78) A(FF,CE,D8,DF) A(FF,CB,59,00) A(FF,D9,6B,02) A(FF,D9,6A,01) A(FF,D1,65,01) A(FF,B6,56,00) A(FF,99,44,00) A(FF,8A,42,21) 
					A(FF,80,40,11) A(FF,57,70,8E) A(FF,20,34,4E) A(FF,3C,62,90) A(FF,47,5E,7A) A(00,00,00,00) A(FF,59,73,93) A(FF,3C,59,7C) A(00,00,00,00) A(FF,B4,9A,82) 
					A(FF,AD,64,25) A(FF,AC,4A,00) A(FF,AC,4A,00) A(FF,A0,49,00) A(FF,94,5D,30) A(FF,92,71,56) A(FF,EB,FF,FF) A(FF,4A,6D,97) A(FF,20,34,4F) A(FF,3C,62,90) 
					A(FF,47,5E,7A) A(00,00,00,00) A(FF,50,6E,96) A(FF,43,5E,7F) A(00,00,00,00) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,B0,D4,E7) A(FF,94,B5,C3) A(FF,C0,ED,FF) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,4C,70,99) A(FF,20,34,4E) A(FF,3B,61,8F) A(FF,4C,68,8A) A(FF,69,95,C8) A(FF,42,67,93) A(FF,5A,6A,7E) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,5B,76,98) 
					A(FF,4E,61,78) A(FF,48,65,8B) A(FF,59,74,93) A(FF,49,63,84) A(FF,7C,8C,A2) A(00,00,00,00) ;
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