note
	component:   "openEHR ADL Tools"
	description: "Test case for removing term binding from ontology"
	keywords:    "test, ADL, CADL"

	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2003, 2004 Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"


class TC_ONTOLOGY_REMOVE_CONSTRAINT_BINDING

inherit
	TEST_CASE
		export
			{NONE} all
		redefine
			prereqs
		end

	SHARED_TEST_ENV
		export
			{NONE} all
		end

create
	make

feature -- Initialisation

	make(arg:ANY)
	    do
	    end

feature -- Access

	title: STRING = "Remove Constraint Binding"

	prereqs: ARRAY[STRING]
			-- ids of prerequisite test cases
		once
			Result := <<"TS_ARCHETYPE_CREATE">>
		end

feature -- testing

	execute
		local
			a_code: STRING
			a_term: ARCHETYPE_TERM
			archetype: ARCHETYPE
		do
			archetype := archetype_compiler.archetype
			ontology.remove_constraint_binding ("ac0002", "snomed-ct")

			if archetype.is_valid then
				archetype_compiler.serialise_archetype (serialise_format)
				io_message.put_string (archetype_compiler.serialised_archetype)
			else
				-- FIXME: This did not compile because of revision 319. What should it do?
				io_message.put_string (archetype.errors)
			end
		end

end

