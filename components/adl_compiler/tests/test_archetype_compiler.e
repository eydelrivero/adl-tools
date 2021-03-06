note
	component:   "openEHR ADL Tools"
	description: "Tests for manipulating an archetype compiler"
	keywords:    "archetype, compiler, build"
	author:      "Peter Gummer"
	support:     "Ocean Informatics <support@OceanInformatics.com>"
	copyright:   "Copyright (c) 2011- Ocean Informatics Pty Ltd"
	license:     "Apache 2.0 License <http://www.apache.org/licenses/LICENSE-2.0.html>"
	testing:     "type/manual"

class
	TEST_ARCHETYPE_COMPILER

inherit
	TEST_ARCHETYPE_DIRECTORY

feature -- Test routines

	test_build_all
			-- Check that the whole repository can be built and then rebuilt.
		note
			testing: "covers/{ARCHETYPE_COMPILER}.build_all"
			testing: "covers/{ARCHETYPE_COMPILER}.rebuild_all"
		do
			create errors.make_empty
			assert_equal (False, archetype_compiler.is_interrupt_requested)
			assert_equal (False, archetype_compiler.is_building)
			assert_equal (False, archetype_compiler.is_full_build_completed)

			archetype_compiler.set_archetype_visual_update_action (agent on_archetype_update)
			archetype_compiler.build_all
			assert_equal (False, archetype_compiler.is_interrupt_requested)
			assert_equal (False, archetype_compiler.is_building)
			assert_equal (True, archetype_compiler.is_full_build_completed)
			assert_equal (current_arch_cat.archetype_count, current_arch_cat.compile_attempt_count)
			assert_equal ("", errors)

			archetype_compiler.rebuild_all
			assert_equal (False, archetype_compiler.is_interrupt_requested)
			assert_equal (False, archetype_compiler.is_building)
			assert_equal (True, archetype_compiler.is_full_build_completed)
			assert_equal (current_arch_cat.archetype_count, current_arch_cat.compile_attempt_count)
			assert_equal ("", errors)
		end

feature {NONE} -- Implementation

	errors: detachable STRING
		-- Error messages during compilation.
		note
			option: stable
		attribute
		end

	on_archetype_update (a_msg: STRING; ara: ARCH_CAT_ARCHETYPE; dependency_depth: INTEGER)
			-- Update with progress on build.
		do
			if ara.compilation_state = ara.cs_invalid then
				errors.append (a_msg + "%R")
			end
		end

end



