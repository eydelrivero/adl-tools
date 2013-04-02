note
	component:   "openEHR Archetype Project"
	description: "Shared access to service interface to object model"
	keywords:    "ADL, archetype, reference model"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class SHARED_REFERENCE_MODEL_ACCESS

feature -- Access

	rm_schemas_access: REFERENCE_MODEL_ACCESS
		once
			create Result.make
		end

	rm_schema_for_archetype_id (an_id: ARCHETYPE_ID): BMM_SCHEMA
			-- top-level schema for archetype id `an_id'
		require
			has_rm_schema_for_archetype_id (an_id)
		do
			Result := rm_schemas_access.schema_for_rm_closure (an_id.qualified_package_name)
		end

	rm_schema_for_id (an_id: STRING): BMM_SCHEMA
			-- validated top-level schema for schema id `an_id'
		require
			has_rm_schema_for_id (an_id)
		do
			check attached rm_schemas_access.valid_top_level_schemas.item (an_id) as sch then
				Result := sch
			end
		end

	rm_schema_all_ids: ARRAYED_LIST [STRING]
		do
			create Result.make_from_array (rm_schemas_access.all_schemas.current_keys)
		end

feature -- Status Report

	has_rm_schema_for_archetype_id (an_id: ARCHETYPE_ID): BOOLEAN
		do
			Result := rm_schemas_access.has_schema_for_rm_closure (an_id.qualified_package_name)
		end

	has_rm_schema_for_id (an_id: STRING): BOOLEAN
		do
			Result := rm_schemas_access.valid_top_level_schemas.has (an_id)
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
--| The Original Code is archetype_directory_item.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2006
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
