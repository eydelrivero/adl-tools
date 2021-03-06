note
	component:   "openEHR ADL Tools"
	description: "[
				 Access to a .ini style configuration file. Comment
				 character settable; defaults to ';'. Category items
				 take the form '[xxxx]'. Name/value pair entries 
				 take the form:
				 	name = value
				 any whitespace can occur around the '='
				 ]"
	keywords:    "config, file"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2003- Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"

class INI_CONFIG_FILE_ACCESS

inherit
	TEXT_FILE_ACCESS
		redefine
			make
		end

create
	make

feature -- Definitions

	default_category: STRING = "default"

	resource_list_item_delimiter: CHARACTER = ','

feature -- Initialisation

	make (a_file_name: STRING)
		do
			create resources.make(0)
			create requested_resources.make(0)
			precursor {TEXT_FILE_ACCESS} (a_file_name)
		end

feature -- Access

	resources: HASH_TABLE [HASH_TABLE [STRING,STRING], STRING]

	requested_resources: HASH_TABLE [HASH_TABLE [STRING,STRING],STRING]

	resource_value (category, resource_name: STRING): STRING
			-- get the value for resource_name, in 'category'
		require
            Valid_category: category /= Void and then not category.is_empty
            Valid_resource_name: resource_name /= Void and then not resource_name.is_empty
		local
            resource_list: HASH_TABLE[STRING,STRING]
		do
            create Result.make(0)

            -- find the category
            resource_list := resources.item(category)
            if resource_list = Void then
           		resource_list := resources.item(default_category)
           	end
            if resource_list /= Void then
     			if resource_list.has(resource_name) then
					Result.copy(resource_list.item(resource_name))
        	    end
			end
		end

	resource_value_list (category, resource_name: STRING): LIST [STRING]
			-- List of items specified in file setting
			-- of the form of a comma-separated list.
		require
			Valid_category: category /= Void and then not category.is_empty
			Valid_resource_name: resource_name /= Void and then not resource_name.is_empty
		do
			Result := resource_value (category, resource_name).split (resource_list_item_delimiter)
			Result.compare_objects
			Result.prune_all ("")
		ensure
			value_comparison: Result.object_comparison
			no_empty_items: Result.for_all (agent (s: STRING): BOOLEAN do Result := attached s and then not s.is_empty end)
		end

	resource_category_values (category: STRING): HASH_TABLE [STRING, STRING]
			-- get all name/value pairs in 'category'
		require
                Valid_category: not category.is_empty
		do
			if resources.has(category) then
				Result := resources.item(category)
			else
				create Result.make(0)
			end
		end

	resource_category_lists (category: STRING): HASH_TABLE [ARRAYED_LIST [STRING], STRING]
			-- get all name/value list pairs in 'category', in a hash, keyed by the resource names
			--
			-- [category]
			-- resource_1=aaa,bbb,ccc
			-- resource_2=ddd,eee,fff
			-- ..
			-- resource_n=ggg,hhh,iii
			--
		require
            Valid_category: not category.is_empty
        local
        	res_list: HASH_TABLE [STRING, STRING]
        	sub_item: STRING
        	al: ARRAYED_LIST [STRING]
		do
			create Result.make(0)
			if resources.has(category) then
				res_list := resources.item(category)
				from res_list.start until res_list.off loop
					sub_item := res_list.item_for_iteration
					create al.make (0)
					al.append(sub_item.split (resource_list_item_delimiter))
					Result.put(al, res_list.key_for_iteration)
					res_list.forth
				end
			end
		end

feature -- Modification

	set_resource_value (category_name, resource_name, value: STRING)
		require
			Valid_category: not category_name.is_empty
			Valid_resource_name: not resource_name.is_empty
		local
			resource_list: HASH_TABLE[STRING,STRING]
		do
			if resources.has(category_name) then
				resource_list := resources.item(category_name)
				resource_list.force(value, resource_name)
			else
				create resource_list.make(0)
				resource_list.put(value, resource_name)
				resources.put(resource_list, category_name)
			end
		end

	set_resource_value_list (category_name, resource_name: STRING; values: LIST [STRING])
		require
			Valid_category: not category_name.is_empty
			Valid_resource_name: not resource_name.is_empty
		local
			resource_list: HASH_TABLE[STRING,STRING]
			s: STRING
		do
			create s.make(0)
			from values.start until values.off loop
				if not values.isfirst then
					s.append_character (resource_list_item_delimiter)
				end
				s.append(values.item)
				values.forth
			end

			if resources.has(category_name) then
				resource_list := resources.item (category_name)
				resource_list.force (s, resource_name)
			else
				create resource_list.make(0)
				resource_list.put (s, resource_name)
				resources.put (resource_list, category_name)
			end
		end

	set_resource_category_lists (category: STRING; res_lists: HASH_TABLE [ARRAYED_LIST [STRING], STRING])
			-- set all name/value list pairs in 'category', in a hash, keyed by the resource names
			-- completely replaces existing set of resources for this category
		require
			Valid_category: not category.is_empty
		local
			res_hash: HASH_TABLE [STRING, STRING]
			s: STRING
			values: ARRAYED_LIST [STRING]
		do
			create res_hash.make(0)
			from res_lists.start until res_lists.off loop
				create s.make(0)
				values := res_lists.item_for_iteration
				from values.start until values.off loop
					if not values.isfirst then
						s.append_character (resource_list_item_delimiter)
					end
					s.append(values.item)
					values.forth
				end
				res_hash.put (s, res_lists.key_for_iteration)
				res_lists.forth
			end
			resources.force(res_hash, category)
		end

feature -- Element Removal

	remove_resource (category_name, resource_name: STRING)
			-- remove the resource resource_name
		require
			Valid_category: not category_name.is_empty
			Valid_resource_name: not resource_name.is_empty
        local
			resource_list: HASH_TABLE[STRING,STRING]
		do
			if resources.has(category_name) then
				resource_list := resources.item(category_name)
				resource_list.remove (resource_name)
			end
		end

feature -- template routines

	initialise
		do
		end

	read_initialise
		do
            resources.wipe_out
		end

	read_finalise
		do
		end

	read_process_file
		local
			category_name, res_name, res_value: STRING
			pos, res_name_dup_count, no_name_dup_count: INTEGER
			cur_res_list: HASH_TABLE [STRING, STRING]
			env_var_value: STRING
			env_var_name: STRING
			candidate_string: STRING
			pos_pair: DS_PAIR [INTEGER, INTEGER]
		do
			from read_line until file.end_of_file loop

				-- try to read either [XXXXXXXXXX] or YYYYYYYYYY=ZZZZZZZZZZZ
				if linebuf.item(1) = '[' then
					-- we are in a category

					-- strip the "[" & "]" chars & any leading or trailing spaces
					category_name := linebuf.substring(2,linebuf.count-1)
					linebuf.left_adjust
					linebuf.right_adjust
					if not resources.has (category_name) then
						create cur_res_list.make(0)
						resources.put (cur_res_list, category_name)
					else
						cur_res_list := resources.item (category_name)
					end
				else
					if cur_res_list = Void then
						create cur_res_list.make(0)
						resources.put(cur_res_list, default_category)
					end

					-- read resource name
					pos := linebuf.index_of('=',1)
					res_name := linebuf.substring(1,pos-1)
					res_name.right_adjust -- remove spaces between name and '='

					-- ensure a unique name; also document errors
					if res_name.is_empty then
						res_name := "NONAME_"
						res_name.append_integer(no_name_dup_count)
						no_name_dup_count := no_name_dup_count + 1
					elseif cur_res_list.has(res_name) then
						res_name.append("_DUPLICATE_")
						res_name.append_integer(res_name_dup_count)
						res_name_dup_count := res_name_dup_count + 1
					end

					-- read the resource value
					if pos+1 <= linebuf.count then        -- something to read
						res_value := linebuf.substring(pos+1,linebuf.count)
						res_value.left_adjust  -- remove spaces between '=' and value

						-- parse any environment variables of the form $NAME which may be
						-- followed by any non-alphanumeric character
						from
							candidate_string := res_value.twin
							pos_pair := env_var_pattern_matcher.matched_position (candidate_string)
						until
							pos_pair = Void
						loop
							env_var_name := candidate_string.substring(pos_pair.first+1, pos_pair.second)
							env_var_value := execution_environment.get(env_var_name)
							if env_var_value /= Void then
								res_value.replace_substring_all("$" + env_var_name, env_var_value)
							end
							if not candidate_string.is_empty then
								candidate_string.replace_substring("", 1, pos_pair.second)
							end
							pos_pair := env_var_pattern_matcher.matched_position (candidate_string)
						end

					else
						res_value := "***** NO VALUE *****"
					end
					cur_res_list.put(res_value, res_name)
				end
				read_line
			end
		end

	is_valid: BOOLEAN
		do
			Result := not last_op_fail
		end

	write_file
		local
			resource_list: HASH_TABLE [STRING,STRING]
			category_name, s: STRING
		do
			file.create_read_write
			from resources.start until resources.off loop
				  category_name := resources.key_for_iteration
				  if not category_name.is_equal(default_category) then
					  file.put_string("[" + category_name + "]")
					  file.new_line
				  end
				  resource_list:= resources.item_for_iteration
				  from resource_list.start until resource_list.off loop
				  		s := resource_list.key_for_iteration + "=" + resource_list.item_for_iteration
					    file.putstring(s)
					    file.new_line
					    resource_list.forth
				  end
				  resources.forth
			end

			file.close
		end

feature {NONE} -- Implementation

	env_var_pattern_matcher: RX_PCRE_REGULAR_EXPRESSION
			-- pattern for detecting $NAME in config values
		once
			create Result.make
			Result.compile (env_var_pattern, True)
		end

	env_var_pattern: STRING = "\$[a-zA-Z0-9_]+"

	execution_environment: EXECUTION_ENVIRONMENT
		once
			create Result
		end

end

