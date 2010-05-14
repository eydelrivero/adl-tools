note
	component:   "openEHR Archetype Project"
	description: "[
				 Simple, fast hand-built parser for handling the top few lines of ADL files, where it can figure
				 out the kind of file (archetype, template, etc) and also the specialisation parent.
				 ]"
	keywords:    "ADL"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2010 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL: http://www.openehr.org/svn/ref_impl_eiffel/BRANCHES/specialisation/components/archetype_repository/src/directory/archetype_file_repository_imp.e $"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate: 2010-05-11 13:00:26 +0100 (Tue, 11 May 2010) $"

class ARCHETYPE_MINI_PARSER

inherit
	SHARED_RESOURCES
		rename
			file_exists as is_valid_path
		export
			{NONE} all;
			{ANY} is_valid_path
		end

feature -- Access

	last_archetype_id: STRING
			-- archetype id read by last invocation of mini_parse_archetype

	last_parent_archetype_id: STRING
			-- parent archetype id read by last invocation of mini_parse_archetype if
			-- `last_archetype_specialised' is True

	last_parse_fail_reason: STRING

	last_archetype_artefact_type: INTEGER

feature -- Status Report

	last_parse_valid: BOOLEAN
			-- True if last parse was ok

	last_archetype_id_old_style: BOOLEAN
			-- true if last archetype id

	last_archetype_specialised: BOOLEAN
			-- true if archetype id read by last invocation of mini_parse_archetype

feature -- Commands

	parse (a_full_path: STRING)
			-- perform quick parse of lines down to 'concept' line or EOF, and obtain archetype_id,
			-- specialisation status and if specialised, specialisation parent
		require
			path_valid: a_full_path /= Void and then is_valid_path (a_full_path)
		local
			lines: LIST [STRING]
			artefact_types: ARTEFACT_TYPE
			id_bad: BOOLEAN
		do
			last_parse_valid := False
			last_archetype_specialised := False
			create artefact_types.default_create

			file_context.set_target (a_full_path)
			file_context.read_n_lines(5)
			lines := file_context.file_lines

			-- first line
			if lines[1].has ('(') then
				lines[1].remove_substring (lines[1].index_of ('(', 1), lines[1].count)
			end
			lines[1].right_adjust
			if artefact_types.valid_type_name (lines[1]) then
				last_archetype_artefact_type := artefact_types.type_name_to_type(lines[1])

				-- get line 2
				lines[2].left_adjust
				lines[2].right_adjust
				if not lines[2].is_empty then
					if (create {ARCHETYPE_ID}).valid_id(lines[2]) then
						last_archetype_id_old_style := False
					elseif (create {ARCHETYPE_ID}).old_valid_id(lines[2]) then
						last_archetype_id_old_style := True
					else
						-- something wrong with the id
						id_bad := True
					end
				else
					id_bad := True
				end

				if not id_bad then
					last_archetype_id := lines[2]

					-- get line 3 - should be either 'specialise' / 'specialize' or 'concept'
					lines[3].right_adjust
					if lines[3].is_equal ("specialise") or lines[3].is_equal("specialize") then
						lines[4].left_adjust
						lines[4].right_adjust
						last_parent_archetype_id := lines[4]
						last_archetype_specialised := True
					end
					last_parse_valid := True
				end
			end
		end

feature {NONE} -- Implementation

	file_context: attached FILE_CONTEXT
			-- Access to the file system.
		once
			create Result.make
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