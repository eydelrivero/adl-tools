note
	component:   "openEHR ADL Tools"
	description: "ADL Terminology class"
	keywords:    "archetype, ontology, terminology"
	author:      "Thomas Beale <thomas.beale@oceaninformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

deferred class ARCHETYPE_TERMINOLOGY

inherit
	DT_CONVERTIBLE
		redefine
			finalise_dt
		end

	ADL_15_TERM_CODE_TOOLS
		export
			{NONE} all;
			{ANY} is_valid_root_id_code, is_valid_id_code, is_valid_value_code, is_valid_constraint_code,
				is_valid_code, specialisation_depth_from_code
		end

	ADL_14_TERM_CODE_TOOLS
		export
			{NONE} all
		end

	ARCHETYPE_DEFINITIONS
		export
			{NONE} all
		end

feature -- Initialisation

	make (an_original_lang, a_concept_code: STRING)
			-- make terminology from concept code and original language
		require
			Original_language_valid: not an_original_lang.is_empty
			root_code_valid: is_valid_root_id_code (a_concept_code)
		do
			if is_valid_root_id_code (a_concept_code) then
				concept_code := a_concept_code
			else
				concept_code := Root_id_code_top_level
			end
			original_language := an_original_lang
		ensure
			concept_code_set: concept_code.is_equal (a_concept_code)
			original_language_set: original_language.is_equal (an_original_lang)
		end

	make_dt (make_args: detachable ARRAY[ANY])
			-- assumed args are <<original_language, concept_code>>
		do
			if attached {STRING} make_args[1] as str then
				original_language := str
			end
			if attached {STRING} make_args[2] as a_concept_code and then is_valid_root_id_code (a_concept_code) then
				concept_code := a_concept_code
			else
				concept_code := Root_id_code_top_level
			end
		end

feature -- Access (Stored)

	original_language:  STRING
			-- original language of the terminology, as set at archetype creation or parsing time; must
			-- be a code in the ISO 639-1 2 character language code-set.

	concept_code: STRING
			-- term code of the concept of the terminology as a whole

	term_definitions: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of term definitions, keyed by code, keyed by language
        attribute
            create Result.make (0)
        end

	term_bindings: HASH_TABLE [HASH_TABLE [URI, STRING], STRING]
			-- tables of bindings of external terms to internal codes and/or paths, keyed by external terminology id
        attribute
            create Result.make (0)
        end

    value_sets: HASH_TABLE [VALUE_SET_RELATION, STRING]
    		-- table of value sets - keyed by ac-code
        attribute
            create Result.make (0)
        end

	terminology_extracts: detachable HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of {code, description} keyed by terminology_id containing extracted concepts from external terminologies

feature -- Access (computed)

	languages_available: ARRAYED_SET [STRING]
		do
			create Result.make(0)
			Result.compare_objects
			across term_definitions as ids_csr loop
				Result.extend (ids_csr.key)
			end
		end

	terminologies_available: ARRAYED_SET [STRING]
			-- set of all terminology names that appear in `term_bindings' or `constraint_bindings'
		local
			terminologies: ARRAY [STRING]
		do
			create Result.make (0)
			Result.compare_objects
			terminologies := term_bindings.current_keys
			terminologies.compare_objects
			Result.merge (terminologies)
		end

	id_codes: TWO_WAY_SORTED_SET [STRING]
			-- list of term codes
        do
            create Result.make
            Result.compare_objects
            across index_term_definitions as defs loop
            	if is_id_code (defs.key) then
            		Result.extend (defs.key)
            	end
            end
        end

	value_codes: TWO_WAY_SORTED_SET [STRING]
			-- list of term codes
        do
            create Result.make
            Result.compare_objects
            across index_term_definitions as defs loop
            	if is_value_code (defs.key) then
            		Result.extend (defs.key)
            	end
            end
        end

	constraint_codes: TWO_WAY_SORTED_SET [STRING]
			-- list of constraint codes
        do
            create Result.make
            Result.compare_objects
            across index_term_definitions as defs loop
            	if is_constraint_code (defs.key) then
            		Result.extend (defs.key)
            	end
            end
        end

	specialisation_depth: INTEGER
			-- depth of this terminology with relation to ontologies in other archetypes
		do
			Result := specialisation_depth_from_code (concept_code)
		ensure
			non_negative: Result >= 0
		end

	term_definition (a_language, a_code: STRING): ARCHETYPE_TERM
			-- retrieve the term definition in language `a_language' for code `a_code'
		require
			Term_definition_exists: has_term_definition (a_language, a_code)
		do
			check attached term_definitions.item (a_language) as tl and then attached tl.item (a_code) as term then
				Result := term
			end
		end

	term_binding (a_terminology, a_key: STRING): URI
			-- retrieve the term binding from terminology `a_terminology' for code `a_key'
		require
			Term_code_valid: has_term_binding (a_terminology, a_key)
		do
			check attached term_bindings.item (a_terminology) as tbs and then attached tbs.item (a_key) as tb then
				Result := tb
			end
		end

	terminology_extract_term (a_terminology, a_code: STRING): ARCHETYPE_TERM
			-- true if there is an extract from terminology `a_terminology'
		require
			Terminology_valid: has_terminology_extract (a_terminology)
			Term_code_valid: has_terminology_extract_code (a_terminology, a_code)
		do
			check attached terminology_extracts.item (a_terminology) as textrs and then attached textrs.item (a_code) as term then
				Result := term
			end
		end

	term_bindings_for_terminology (a_terminology: STRING): HASH_TABLE [URI, STRING]
			-- retrieve the term bindings for a particular terminology
		require
			Terminology_valid: term_bindings.has (a_terminology)
		do
			check attached term_bindings.item (a_terminology) as tbs then
				Result := tbs
			end
		end

	term_bindings_for_key (a_key: STRING): HASH_TABLE [URI, STRING]
			-- retrieve the term bindings for a key (code or path) as a table of bound terms keyed by terminology_id
		require
			Terminology_valid: has_any_term_binding (a_key)
		do
			create Result.make (0)
			across term_bindings as bindings_for_terminology_csr loop
				if attached bindings_for_terminology_csr.item.item (a_key) as binding_for_key then
					Result.put (binding_for_key, bindings_for_terminology_csr.key)
				end
			end
		end

	definition_for_code (a_lang, a_code: STRING): detachable ARCHETYPE_TERM
			-- extract the term or constraint definition for `a_code'; Void if no
			-- code for `a_lang' and 'a_code'
		do
			if has_language (a_lang) and then attached term_definitions.item (a_lang) as tl then
				Result := tl.item (a_code)
			end
		end

	last_new_definition_code: STRING
		attribute
			create Result.make_empty
		end

feature -- Status Report

	has_language (a_language: STRING): BOOLEAN
			-- check that `a_language' supported
		require
			Language_valid: not a_language.is_empty
		do
			Result := term_definitions.has (a_language)
		end

	has_terminology (a_terminology: STRING): BOOLEAN
			-- is `a_terminology' known in this terminology?
		do
			Result := term_bindings.has (a_terminology)
		end

	has_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in this terminology
		do
			term_definitions.start
			Result := term_definitions.item_for_iteration.has (a_code)
		end

	has_id_code (an_id_code: STRING): BOOLEAN
			-- is `a_code' known in this terminology
		do
			Result := id_codes.has (an_id_code)
		end

	has_value_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in the at-terms list of this terminology
		do
			Result := value_codes.has (a_code)
		end

	has_constraint_code (a_code: STRING): BOOLEAN
			-- is `a_code' known in the terms list of this terminology
		do
			Result := constraint_codes.has (a_code)
		end

	has_term_definition (a_language, a_code: STRING): BOOLEAN
			-- is `a_code' defined in `a_language' in the relevant code table of this terminology?
		require
			Language_valid: not a_language.is_empty
		do
			if term_definitions.has (a_language) and then attached term_definitions.item (a_language) as term_def_for_lang then
				Result := term_def_for_lang.has (a_code)
			end
		end

	has_any_term_binding (a_key: STRING): BOOLEAN
			-- true if there is any term binding for code or path `a_key' for any terminology
		do
			Result := across term_bindings as bindings_csr some bindings_csr.item.has (a_key) end
		end

	has_term_binding (a_terminology, a_key: STRING): BOOLEAN
			-- true if there is a term binding for key `a_key' in `a_terminology'
		do
			Result := term_bindings.has (a_terminology) and then term_bindings.item (a_terminology).has (a_key)
		end

	has_terminology_extract (a_terminology: STRING): BOOLEAN
			-- true if there is an extract from terminology `a_terminology'
		require
			Terminology_valid: not a_terminology.is_empty
		do
			Result := terminology_extracts.has (a_terminology)
		end

	has_terminology_extract_code (a_terminology, a_code: STRING): BOOLEAN
			-- true if there is a term binding for code `a_code' in `a_terminology'
		require
			Terminology_valid: not has_terminology_extract (a_terminology)
			Term_code_valid: not a_code.is_empty
		do
			Result := terminology_extracts.item (a_terminology).has (a_code)
		end

	has_term_bindings (a_terminology: STRING): BOOLEAN
			-- true if there are term bindings `a_terminology'
		do
			Result := term_bindings.has (a_terminology)
		end

feature -- Comparison

	semantically_conforms_to (other: FLAT_ARCHETYPE_TERMINOLOGY): BOOLEAN
			-- True if this terminology conforms to `other' by having the same or subset of languages
		do
			Result := languages_available.is_subset (other.languages_available)
		end

feature -- Conversion

	substitute_id_codes (str, lang: STRING): STRING
			-- substitute all occurrences of archetype codes in 'str'
			-- with their term texts from this terminology, in 'lang'
		require
			Str_valid: not str.is_empty
			Lang_valid: has_language(lang)
		local
			code: STRING
			start_pos, end_pos: INTEGER
		do
			create Result.make(0)
			Result.append (str)
			from
				start_pos := str.substring_index ("[" + Id_code_leader, 1)
			until
				start_pos <= 0
			loop
				end_pos := str.index_of (']', start_pos)
				code := str.substring (start_pos+1, end_pos-1)
				if has_code (code) then
					Result.replace_substring_all (code, term_definition (lang, code).text)
				end
				start_pos := str.substring_index ("[" + Id_code_leader, end_pos)
			end
		end

	annotated_path (a_phys_path, a_language: STRING; with_codes: BOOLEAN): STRING
			-- generate a logical path in 'a_language' from a physical path
			-- if `with_code' then generate annotated form of each code, i.e. "code|text|"
		require
			a_lang_valid: not a_language.is_empty
		local
			id_code, log_str: STRING
			og_phys_path, og_log_path: OG_PATH
		do
			create og_phys_path.make_from_string (a_phys_path)
			create og_log_path.make_from_other (og_phys_path)
			from
				og_phys_path.start
				og_log_path.start
			until
				og_phys_path.off
			loop
				if og_phys_path.item.is_addressable then
					id_code := og_phys_path.item.object_id
					if is_valid_id_code (id_code) and then has_id_code (id_code) then
						if with_codes then
							log_str := annotated_code (id_code, term_definition (a_language, id_code).text, "")
						else
							log_str := term_definition (a_language, id_code).text
						end
						og_log_path.item.set_object_id (log_str)
					else
						og_log_path.item.set_object_id (id_code)
					end
				end
				og_phys_path.forth
				og_log_path.forth
			end

			Result := og_log_path.as_string
		end

feature -- Modification

	create_added_id_definition (a_text, a_description: STRING)
			-- add a new term definition with 'text' = `a_text', 'description = `a_description',
			-- assumed to be in the original language;
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_term_definition'
		local
			new_term: ARCHETYPE_TERM
		do
			create new_term.make_all (new_added_id_code_at_level (specialisation_depth, highest_id_code), a_text, a_description)
			put_new_definition (original_language, new_term)
			last_new_definition_code := new_term.code
		end

	create_added_value_definition (a_text, a_description: STRING)
			-- add a new term definition with 'text' = `a_text', 'description = `a_description',
			-- assumed to be in the original language;
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_term_definition'
		local
			new_term: ARCHETYPE_TERM
		do
			create new_term.make_all (new_added_value_code_at_level (specialisation_depth, highest_value_code), a_text, a_description)
			put_new_definition (original_language, new_term)
			last_new_definition_code := new_term.code
		end

	create_added_constraint_definition (a_text, a_description: STRING)
			-- add a new constraint definition with 'text' = `a_text', 'description = `a_description';
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_constraint_definition'
		local
			new_term: ARCHETYPE_TERM
		do
			create new_term.make_all (new_added_constraint_code_at_level (specialisation_depth, highest_constraint_code), a_text, a_description)
			put_new_definition (original_language, new_term)
			last_new_definition_code := new_term.code
		end

	create_refined_definition (a_parent_code, a_text, a_description: STRING)
			-- add a new constraint definition as child of `a_parent_code'
			-- with 'text' = `a_text', 'description = `a_description';
			-- automatically add translation placeholders in all other languages
			-- return the new code in `last_added_definition'
		require
			Term_valid: specialisation_depth_from_code (a_parent_code) < specialisation_depth
		local
			new_term: ARCHETYPE_TERM
			high_code: INTEGER
		do
			if highest_refined_code_index.has (a_parent_code) then
				high_code := highest_refined_code_index [a_parent_code]
			else
				high_code := 1
			end
			create new_term.make_all (new_refined_code_at_level (a_parent_code, specialisation_depth, high_code), a_text, a_description)
			put_new_definition (original_language, new_term)
			last_new_definition_code := new_term.code
		end

	put_term_binding (a_term_code: URI; a_terminology_id, a_code: STRING)
			-- add a new term binding to local code a_code, in the terminology
			-- group corresponding to the a_term_code.terminology
		require
			Local_code_valid: has_code (a_code)
			Not_already_added: not has_term_binding (a_terminology_id, a_code)
		do
			if not has_term_bindings (a_terminology_id) then
				term_bindings.put (create {HASH_TABLE [URI, STRING]}.make(0), a_terminology_id)
			end
			if attached term_bindings.item (a_terminology_id) as bindings then
				bindings.put (a_term_code, a_code)
			end
		ensure
			Binding_added: has_term_binding (a_terminology_id, a_code)
		end

	replace_term_definition_item (a_language: STRING; a_code, a_key, a_value: STRING)
			-- replace a field denoted by `a_key' of the term with code `a_code'
		require
			Language_valid: has_language (a_language)
			Term_valid: has_code (a_code)
		do
			if attached term_definitions.item (a_language) as defs_for_lang and then
				attached defs_for_lang.item (a_code) as term and then term.has_key (a_key)
			then
				term.set_value (a_value, a_key)
			end
		end

	replace_term_binding (a_binding: URI; a_terminology_id, a_code: STRING)
			-- replaces existing a term binding to local code a_code, in group a_terminology
		require
			Local_code_valid: has_code (a_code)
			Already_added: has_term_binding (a_terminology_id, a_code)
		do
			term_bindings.item (a_terminology_id).replace (a_binding, a_code)
		ensure
			Binding_added: has_term_binding (a_terminology_id, a_code)
		end

	replicate_term_definition (an_old_code, a_new_code: STRING)
			-- make a copy of the term with code `an_old_code' in all languages, and add as a new term with code `a_new_code'
		require
			Old_code_valid: has_code (an_old_code)
			New_code_valid: not has_code (a_new_code)
		local
			new_term: ARCHETYPE_TERM
		do
			across term_definitions as term_defs_for_lang_csr loop
				check attached term_defs_for_lang_csr.item.item (an_old_code) as att_term then
					new_term := att_term.deep_twin
				end
				new_term.set_code (a_new_code)
				term_defs_for_lang_csr.item.put (new_term, a_new_code)
			end
			update_highest_codes (a_new_code)
			clear_cache
		ensure
			has_code (a_new_code)
		end

feature {DIFFERENTIAL_ARCHETYPE, AOM_POST_PARSE_PROCESSOR} -- Modification

	remove_definition (a_code: STRING)
			-- completely remove the term from the terminology
		require
			Code_found: has_code (a_code)
		local
			terminologies: ARRAYED_LIST[STRING]
			langs_to_remove: ARRAYED_LIST[STRING]
		do
			create langs_to_remove.make(0)
			across term_definitions as defs_csr loop
				defs_csr.item.remove (a_code)
				if defs_csr.item.count = 0 then
					langs_to_remove.extend (defs_csr.key)
				end
			end

			across langs_to_remove as lang_terms_csr loop
				term_definitions.remove (lang_terms_csr.item)
			end

			-- make a copy of terminologies list, since the next action might modify it...
			create terminologies.make_from_array (term_bindings.current_keys)
			if has_any_term_binding (a_code) then
				across terminologies as terminologies_csr loop
					if term_bindings.has (terminologies_csr.item) and then
						term_bindings.item (terminologies_csr.item).has (a_code)
					then
						remove_term_binding (a_code, terminologies_csr.item)
					end
				end
			end
			clear_cache
		ensure
			not has_code (a_code)
		end

	remove_term_binding (a_code, a_terminology: STRING)
			-- remove term binding to local code in group a_terminology
		require
			Has_binding: has_term_binding (a_terminology, a_code)
		do
			term_bindings.item (a_terminology).remove (a_code)
			if term_bindings.item (a_terminology).count = 0 then
				term_bindings.remove (a_terminology)
			end
		ensure
			Binding_removed: not has_term_binding (a_terminology, a_code)
		end

	remove_term_bindings (a_code: STRING)
			-- remove term binding to local code in all terminologies
		local
			terminologies_to_remove: ARRAYED_LIST [STRING]
		do
			create terminologies_to_remove.make (0)
			across term_bindings as bindings_csr loop
				if bindings_csr.item.has (a_code) then
					bindings_csr.item.remove (a_code)
					if bindings_csr.item.is_empty then
						terminologies_to_remove.extend (bindings_csr.key)
					end
				end
			end

			-- make any removals of entire treminologies needed
			across terminologies_to_remove as terminologies_csr loop
				term_bindings.remove (terminologies_csr.item)
			end
		end

feature {DIFFERENTIAL_ARCHETYPE_TERMINOLOGY} -- Modification

	put_new_definition (a_language: STRING; a_term: ARCHETYPE_TERM)
			-- add a new term definition for language `a_language' and
			-- automatically add translation placeholders in all other languages
		require
			Term_valid: not has_code (a_term.code) and specialisation_depth_from_code (a_term.code) <= specialisation_depth
			Definition_is_new: not has_term_definition (a_language, a_term.code)
		local
			trans_term: ARCHETYPE_TERM
		do
			if not term_definitions.has (a_language) then
				term_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_language)
			end
			term_definitions.item (a_language).force (a_term, a_term.code)
			trans_term := a_term.create_translated_term (original_language)
			across term_definitions as term_defs_csr loop
				if not term_defs_csr.key.is_equal (a_language) then
					if not term_definitions.has (term_defs_csr.key) then
						term_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), term_defs_csr.key)
					end
					term_defs_csr.item.force (trans_term.deep_twin, trans_term.code)
				end
			end

			update_highest_codes (a_term.code)
			clear_cache
		ensure
			Code_valid: has_code (a_term.code)
			Definition_added: has_term_definition (a_language, a_term.code)
		end

	replace_definition (a_language: STRING; a_term: ARCHETYPE_TERM; replace_translations: BOOLEAN)
			-- replace the definition of an existing term code; replace all translations
			-- if flag set and `a_language' is the primary language
		require
			Language_valid: has_language (a_language)
			Term_valid: has_code (a_term.code)
		do
			if a_language.is_equal (original_language) and replace_translations then
				put_new_definition (a_language, a_term) -- replace all translations as well
			else
				term_definitions.item (a_language).replace (a_term, a_term.code) -- just do this translation
			end
			clear_cache
		end

	put_definition_and_translations (a_terms: HASH_TABLE [ARCHETYPE_TERM, STRING]; a_code: STRING)
			-- add or replace the terms in `a_terms' in the languages which are the keys of `a_terms'
		require
			Code_new: not has_code (a_code)
			Code_depth_valid: specialisation_depth_from_code (a_code) <= specialisation_depth
			Term_codes_identical: across a_terms as a_terms_csr all a_terms_csr.item.code.is_equal(a_code) end
		do
			across a_terms as a_terms_csr loop
				if not term_definitions.has (a_terms_csr.key) then
					term_definitions.put (create {HASH_TABLE[ARCHETYPE_TERM, STRING]}.make(0), a_terms_csr.key)
				end
				term_definitions.item (a_terms_csr.key).force (a_terms_csr.item, a_code)
			end
			update_highest_codes (a_code)
			clear_cache
		ensure
			Code_valid: has_code (a_code)
		end

feature {ARCHETYPE_TERMINOLOGY} -- Modification

	highest_refined_code_index: HASH_TABLE [INTEGER, STRING]
			-- Table of current highest code keyed by its parent code, for all specialised codes
			-- in this terminology at its level of specialisation.
			-- For example the entry for key 'at0007' could be 5, meaning that current top child
			-- code of 'at7' is 'at7.5'
        attribute
            create Result.make (0)
        end

	highest_id_code: INTEGER
			-- highest added id code at the level of this terminology; 0 if none so far

	highest_value_code: INTEGER
			-- highest added term code at the level of this terminology; 0 if none so far

	highest_constraint_code: INTEGER
			-- highest added constraint code at the level of this terminology; 0 if none so far

	update_highest_codes (a_code: STRING)
			-- update highest codes either at top level, or for refined codes
			-- spec depth = 0: id47 -> use the 47 & compare with current highest
			-- spec depth = 3: id0.0.12 -> use the 12 & compare with current highest
		require
			Code_valid: is_valid_code (a_code)
		local
			idx: INTEGER
			parent_code, idx_string: STRING
		do
			if is_refined_code (a_code) then
				parent_code := specialisation_parent_from_code (a_code)
				idx := specialised_code_tail (a_code).to_integer
				if idx > highest_refined_code_index [parent_code] then
					highest_refined_code_index [parent_code] := idx
				end

			elseif specialisation_depth_from_code (a_code) = specialisation_depth then
				idx_string := index_from_code_at_level (a_code, specialisation_depth)
				if idx_string.is_integer then
					idx := idx_string.to_integer
					if is_id_code (a_code) then
						highest_id_code := highest_id_code.max (idx)
					elseif is_value_code (a_code) then
						highest_value_code := highest_value_code.max (idx)
					elseif is_constraint_code (a_code) then
						highest_constraint_code := highest_constraint_code.max (idx)
					end
				end
			end
		end

	sync_stored_properties
			-- update various stored properties to correspond to primary stored properties
		local
			code: STRING
		do
			-- populate id code list & set codes in ARCHETYPE_TERM objects
			clear_cache
			across index_term_definitions as term_defs_csr loop
				code := term_defs_csr.key
				term_defs_csr.item.set_code (code)
				-- code might not be valid if just read this terminology in from a file
				if is_valid_code (code) then
					update_highest_codes (code)
				end
			end
		end

feature {NONE} -- Legacy

	constraint_definitions: HASH_TABLE [HASH_TABLE [ARCHETYPE_TERM, STRING], STRING]
			-- table of constraint definitions, keyed by code, keyed by language
        attribute
            create Result.make (0)
        end

	constraint_bindings: HASH_TABLE [HASH_TABLE [URI, STRING], STRING]
			-- table of constraint bindings in the form of strings "service::query", keyed by terminology
        attribute
            create Result.make (0)
        end

    merge_constraint_definitions_and_bindings
    	do
    		across constraint_definitions as cons_defs_for_lang_csr loop
    			if term_definitions.has (cons_defs_for_lang_csr.key) and then attached term_definitions.item (cons_defs_for_lang_csr.key) as term_defs then
    				term_defs.merge (cons_defs_for_lang_csr.item)
    			end
    		end
     		across constraint_bindings as cons_bindings_for_terminology_csr loop
    			if not term_bindings.has (cons_bindings_for_terminology_csr.key) then
					term_bindings.put (create {HASH_TABLE [URI, STRING]}.make(0), cons_bindings_for_terminology_csr.key)
				end
    			if attached term_bindings.item (cons_bindings_for_terminology_csr.key) as bindings then
    				bindings.merge (cons_bindings_for_terminology_csr.item)
    			end
    		end
    	end

feature {P_ARCHETYPE_TERMINOLOGY, AOM_POST_PARSE_PROCESSOR} -- Implementation

	set_term_definitions (a_term_defs: like term_definitions)
		do
			term_definitions := a_term_defs
		end

	set_term_bindings (a_term_bindings: like term_bindings)
		do
			term_bindings := a_term_bindings
		end

	set_terminology_extracts (a_term_extracts: like terminology_extracts)
		do
			terminology_extracts := a_term_extracts
		end

	set_value_sets (a_value_sets: like value_sets)
		do
			value_sets := a_value_sets
		end

feature -- Finalisation

	finalise_dt
			-- finalisation routine to guarantee validity on creation
		do
			sync_stored_properties
			merge_constraint_definitions_and_bindings
		end

feature {DT_OBJECT_CONVERTER} -- Conversion

	persistent_attributes: ARRAYED_LIST [STRING]
			-- list of attribute names to persist as DT structure
			-- empty structure means all attributes
		once
			create Result.make(0)
			Result.compare_objects
			Result.extend ("term_definitions")
			Result.extend ("term_bindings")
			Result.extend ("value_sets")
		end

feature {NONE} -- Implementation

	clear_cache
		do
			index_term_definitions_cache := Void
		end

	index_term_definitions: HASH_TABLE [ARCHETYPE_TERM, STRING]
			-- term definitions table for original language
		do
			if attached index_term_definitions_cache as att_cache then
				Result := att_cache
			elseif attached term_definitions.item (original_language) as att_terms then
				Result := att_terms
				index_term_definitions_cache := Result
			else
				create Result.make (0)
				index_term_definitions_cache := Result
			end
		end

	index_term_definitions_cache: detachable HASH_TABLE [ARCHETYPE_TERM, STRING]
		note
			option: transient
		attribute
		end

	has_path (a_path: STRING): BOOLEAN
			-- True if path `a_path' exists in structure
		require
			a_path_valid: not a_path.is_empty
		do
			Result := dt_representation.has_path (a_path)
		end

invariant
	Original_language_valid: not original_language.is_empty
	Root_code_valid: is_valid_root_id_code (concept_code)
	Concept_code_defined: id_codes.has (concept_code)
	Highest_term_code_index_valid: highest_value_code >= 0
	Highest_constraint_code_valid: highest_constraint_code >= 0

end


