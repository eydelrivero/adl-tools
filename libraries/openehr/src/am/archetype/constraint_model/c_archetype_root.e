note
	component:   "openEHR ADL Tools"
	description: "[
			     Object node representing a root point of an archetype included within another archetype, either as a 
				 direct reference or as a slot filler. The possible configurations of this object are:
				 	- ARCHETYPE_SLOT specialisation: archetype_id, node_id of slot object ==> node_id is from an ancestor level
				 	- ARCHETYPE_SLOT specialisation: archetype_id, no node_id (slot object with no node_id); path can be found in flat parent
				 	- New object in any level of archetype: archetype_id, node_id (if required by usual rules) ==> node_id is from current level
				 	- New object in any level of archetype: archetype_id, no node_id (if not required); path cannot be found in flat parent
			     ]"
	keywords:    "test, ADL"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2010- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class C_ARCHETYPE_ROOT

inherit
	C_COMPLEX_OBJECT
		rename
			make_identified as cco_make_identified
		redefine
			out, enter_subtree, exit_subtree
		end

create
	make

feature -- Initialisation

	make (a_rm_type_name, a_node_id, an_archetype_id: STRING)
			-- make as an archetype external reference
		require
			Rm_type_name_valid: not a_rm_type_name.is_empty
			Node_id_valid: is_valid_id_code (a_node_id)
			Archetype_id_valid: valid_archetype_id (an_archetype_id)
		do
			cco_make_identified (a_rm_type_name, a_node_id)
			archetype_ref := an_archetype_id
		end

feature -- Access

	archetype_ref: STRING
			-- id of filler archetype
		attribute
			create Result.make_empty
		end

feature -- Output

	out: STRING
			-- stringify for GUI use
		do
			create Result.make(0)
			Result.append (rm_type_name + "[" + node_id + "] ")
			if attached occurrences as occ then
				Result.append (occ.as_string)
			end
			Result.append (" " + archetype_ref)
		end

feature -- Visitor

	enter_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at start of block for this node
		do
			visitor.start_c_archetype_root (Current, depth)
		end

	exit_subtree (visitor: C_VISITOR; depth: INTEGER)
			-- perform action at end of block for this node
		do
			visitor.end_c_archetype_root (Current, depth)
		end

end


