note
	component:   "openEHR ADL Tools"
	description: "Generic details of an audit trail"
	keywords:    "version control"
	design:      "openEHR Common Reference Model 2.0"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2005- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class AUDIT_DETAILS

inherit
	EXTERNAL_ENVIRONMENT_ACCESS
		export
			{NONE} all;
			{ANY} deep_copy, deep_twin, is_deep_equal, standard_is_equal
		end

create
	make

feature -- Initialization

	make (a_system_id: STRING; a_committer: PARTY_PROXY;
						a_time_committed: DV_DATE_TIME; a_change_type: DV_CODED_TEXT;
						a_description: DV_TEXT)
		require
			a_system_id_valid: not a_system_id.is_empty
		do
			system_id := a_system_id
			committer := a_committer
			time_committed := a_time_committed
			change_type := a_change_type
			description := a_description
		ensure
			system_id = a_system_id
			committer = a_committer
			time_committed = a_time_committed
			change_type = a_change_type
			description = a_description
		end

feature -- Access

	system_id: STRING
			-- Identity of the node where the item was committed.

	committer: PARTY_PROXY
			-- Identity of party who committed the item.

	time_committed: DV_DATE_TIME
			-- Time of committal of the item.

	change_type: DV_CODED_TEXT
			-- Type of change. Coded using the openEHR Terminology �audit change type� group.

	description: DV_TEXT
			-- description of this contribution overall

invariant
	System_id_valid: not system_id.is_empty
	Change_type_valid: terminology (Terminology_id_openehr).has_code_for_value_set (Group_id_audit_change_type, change_type.defining_code)

end


