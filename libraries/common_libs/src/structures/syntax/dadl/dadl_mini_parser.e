note
	component:   "openEHR Archetype Project"
	description: "[
				 Simple, fast hand-built parser for handling the top few lines of DADL files. Enables
				 extraction of one or more top-level attribute values.
				 ]"
	keywords:    "ADL, DADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class DADL_MINI_PARSER

inherit
	SHARED_APP_RESOURCES
		rename
			file_exists as is_valid_path
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal, is_valid_path
		end

feature -- Definitions

	Max_lines: INTEGER = 15
			-- maximum number of non-comment lines to process

	Comment_leader: STRING = "--"
			-- dADL comment line leader

feature -- Access

	last_parse_content: HASH_TABLE [STRING, STRING]
			-- table of {attr_name, value} pairs

	last_parse_fail_reason: STRING

	last_parse_status: STRING

	last_parse_content_item (a_key: STRING): STRING
			-- more forgiving form of access to items in parse table; if nothing available
			-- return an empty string
		do
			if last_parse_content.has (a_key) and then attached last_parse_content.item (a_key) as val then
				Result := val
			else
				create Result.make_empty
			end
		end

feature -- Status Report

	last_parse_valid: BOOLEAN
			-- True if last parse was ok

feature -- Commands

	extract_attr_values (a_full_path: STRING; attr_names: ARRAY[STRING])
			-- perform quick parse of lines down to line starting with `an_attr_name'; if found, extract its value
			-- and put it in `last_parse_content'. Will stop after Max_lines of non-comment lines.
			-- `last_parse_valid' set if content matching any attr_name found
			-- Only works for dadl single-line key/val pairs, i.e. not for values extending over one line
		require
			path_valid: is_valid_path (a_full_path)
		local
			line, val, key, str: STRING
			lpos, rpos, i: INTEGER
		do
			last_parse_valid := False
			file_context.set_target (a_full_path)
			file_context.read_matching_lines (attr_names, Comment_leader, Max_lines)
			create last_parse_content.make (0)

			if file_context.file_lines.count > 0 then
				across file_context.file_lines as file_lines_csr loop
					line := file_lines_csr.item
					lpos := line.index_of ('<', 1)+1
					if lpos > 1 then
						rpos := line.index_of ('>', lpos)-1
						if rpos >= lpos then
							-- check for quoted "" or '' and remove
							if line.item (lpos) = '%"' or line.item (lpos) = '%'' then
								lpos := lpos + 1
							end
							if line.item (rpos) = '%"' or line.item (rpos) = '%'' then
								rpos := rpos - 1
							end

							val := line.substring (lpos, rpos)
							key := line.substring (1, line.index_of (' ', 1)-1)
							last_parse_content.put (val, key)
						else
							last_parse_fail_reason := get_msg ("parse_dadl_missing_right_delim", <<line>>)
						end
					else
						last_parse_fail_reason := get_msg ("parse_dadl_missing_left_delim", <<line>>)
					end
				end
			else
				create str.make_empty
				from i := attr_names.lower until i > attr_names.upper loop
					str.append (attr_names[i])
					if i /= attr_names.upper then
						str.append(", ")
					end
					i := i + 1
				end
				last_parse_fail_reason := get_msg ("parse_dadl_missing_left_delim", <<str>>)
			end
			last_parse_valid := not last_parse_content.is_empty
		ensure
			last_parse_valid implies (attached last_parse_content and not last_parse_content.is_empty)
		end

feature {NONE} -- Implementation

	file_context: FILE_CONTEXT
			-- Access to the file system.
		once
			create Result
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
--| The Original Code is file_context.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2003-2004
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
