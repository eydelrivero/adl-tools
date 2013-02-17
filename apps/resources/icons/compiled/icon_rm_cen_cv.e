note
	description: "Icon loader class generated by icondbc"
	keywords:    "Embedded icons"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class ICON_RM_CEN_CV

inherit
	ICON_SOURCE

create
	make

feature {NONE} -- Initialization

	make
			-- Initialization
		do
			key := "rm/cen/cv"
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
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,82,A1,C8) A(FF,7C,9C,C5) A(FF,7B,9C,C3) A(FF,7B,9C,C3) A(FF,7B,9C,C3) A(FF,7B,9C,C3) 
					A(FF,7B,9B,C3) A(FF,81,9D,BF) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,81,96,AF) 
					A(FF,43,6A,99) A(FF,49,70,A0) A(FF,49,71,A0) A(FF,49,70,9E) A(FF,49,71,A0) A(FF,49,71,A0) A(FF,49,72,A2) A(FF,47,61,81) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,AF,BC,C9) A(FF,5C,76,96) A(FF,5E,76,95) A(FF,53,6E,8E) A(FF,3D,65,93) 
					A(FF,3F,5C,81) A(FF,5E,77,96) A(FF,60,79,97) A(FF,61,77,91) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,62,7D,9D) A(FF,3D,64,92) A(FF,45,5F,82) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,65,80,A0) A(FF,3D,64,92) A(FF,45,60,82) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,65,80,A0) A(FF,3D,64,92) A(FF,45,60,82) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(FF,65,81,A1) A(FF,3D,64,92) A(FF,45,60,82) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,65,80,A1) A(FF,3D,64,92) 
					A(FF,45,61,82) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,65,80,A1) A(FF,3D,64,92) A(FF,45,61,82) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,65,7F,A1) A(FF,3D,64,93) A(FF,45,61,83) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,6D,87,A7) A(FF,36,59,83) A(FF,47,62,81) A(00,00,00,00) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) 
					A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) A(FF,FF,FF,FF) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) A(FF,00,00,80) 
					A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) 
					A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) 
					A(00,00,00,00) A(FF,00,00,80) A(FF,00,00,80) A(FF,00,00,80) A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) 
					A(00,00,00,00) A(FF,00,00,80) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) A(00,00,00,00) ;
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