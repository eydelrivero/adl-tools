note
	component:   "openEHR framework"
	description: "Load all icons files in a directory and put them in a Hash table keyed by path"
	keywords:    "embedded icons, pixmaps, class generation"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2013- Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

class ICON_FILE_TABLE

inherit
	KL_SHARED_FILE_SYSTEM

create
	make

feature -- Definitions

	icon_ico_extension: STRING = ".ico"

	icon_png_extension: STRING = ".png"

feature -- Initialisation

	make (an_icon_dir: STRING; verbose_mode_flag: BOOLEAN)
			-- make with a directory under which icons can be found
		require
			file_system.directory_exists (an_icon_dir)
		do
			icon_directory := an_icon_dir
			verbose_mode := verbose_mode_flag
			create icon_pixmaps.make (0)
			recursive_load_pixmaps (icon_pixmaps, "")
		end

feature -- Access

	icon_directory: STRING

	icon_pixmaps: HASH_TABLE [EV_PIXEL_BUFFER, STRING]
			-- Table of pixmap file paths keyed by relative path, e.g.
			-- tool/save
			-- tool/edit
			-- rm/openehr/entry

feature -- Status Report

	verbose_mode: BOOLEAN

feature {NONE} -- Implementation

	recursive_load_pixmaps (pixmap_table: HASH_TABLE [EV_PIXEL_BUFFER, STRING]; rel_path: STRING)
			-- load .png and .ico pixmaps into `pixmaps', keyed by relative path under icons root directory
		local
			pixmap: EV_PIXEL_BUFFER
			abs_path, full_path, new_rel_path, key: STRING
			dir: DIRECTORY
			dir_items: ARRAYED_LIST [STRING_32]
		do
			abs_path := file_system.pathname (icon_directory, rel_path)
			create dir.make (abs_path)
			dir.open_read
			dir_items := dir.linear_representation_32

			-- process files
			across dir_items as dir_items_csr loop
				if dir_items_csr.item.item (1) /= '.' then
					full_path := file_system.pathname (abs_path, dir_items_csr.item)
					new_rel_path := file_system.pathname (rel_path, dir_items_csr.item)
					if file_system.directory_exists (full_path) then
						-- process child directory
						recursive_load_pixmaps (pixmap_table, new_rel_path)

					elseif full_path.ends_with (icon_ico_extension) or full_path.ends_with (icon_png_extension) then
						create pixmap
						pixmap.set_with_named_file (full_path)
				--		pixmap.set_minimum_size (pixmap.width, pixmap.height)
						key := new_rel_path.twin
						key.remove_tail (key.count - key.last_index_of ('.', key.count) + 1)
						key.to_lower
						key.replace_substring_all ("\", "/")
						pixmap_table.put (pixmap, key)
						if verbose_mode then
							io.put_string ("loaded " + key + "%N")
						end
					end
				end
			end
		end

end


--|
--| ***** BEGIN LICENSE BLOCK *****
--| Version: MPL 1.1/GPL 2.0/LGPL 2.1
--|
--| The contents of this file are subject to the Mozilla Public License Version
--| 1.1 (the 'License'); you may not use this file except in compliance with
--| the License. You may obtain a copy of the License at
--| http://www.mozilla.org/MPL/
--|
--| Software distributed under the License is distributed on an 'AS IS' basis,
--| WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
--| for the specific language governing rights and limitations under the
--| License.
--|
--| The Original Code is shared_ui_resources.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2013
--| the Initial Developer. All Rights Reserved.
--|
--| Contributor(s):
--|
--| Alternatively, the contents of this file may be used under the terms of
--| either the GNU General Public License Version 2 or later (the 'GPL'), or
--| the GNU Lesser General Public License Version 2.1 or later (the 'LGPL'),
--| in which case the provisions of the GPL or the LGPL are applicable instead
--| of those above. If you wish to allow use of your version of this file only
--| under the terms of either the GPL or the LGPL, and not to allow others to
--| use your version of this file under the terms of the MPL, indicate your
--| decision by deleting the provisions above and replace them with the notice
--| and other provisions required by the GPL or the LGPL. If you do not delete
--| the provisions above, a recipient may use your version of this file under
--| the terms of any one of the MPL, the GPL or the LGPL.
--|
--| ***** END LICENSE BLOCK *****
--|