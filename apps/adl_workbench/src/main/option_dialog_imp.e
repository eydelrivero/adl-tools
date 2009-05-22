note
	description: "[
		Objects that represent an EV_DIALOG.
		The original version of this class was generated by EiffelBuild.
		This class is the implementation of an EV_DIALOG generated by EiffelBuild.
		You should not modify this code by hand, as it will be re-generated every time
		 modifications are made to the project.
		 	]"
	generator: "EiffelBuild"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	OPTION_DIALOG_IMP

inherit
	EV_DIALOG
		redefine
			initialize, is_in_default_state
		end
			
	CONSTANTS
		undefine
			is_equal, default_create, copy
		end

feature {NONE}-- Initialization

	initialize
			-- Initialize `Current'.
		local
			internal_font: EV_FONT
		do
			Precursor {EV_DIALOG}
			initialize_constants
			
				-- Create all widgets.
			create l_ev_vertical_box_1
			create l_ev_horizontal_box_1
			create l_ev_frame_1
			create l_ev_horizontal_box_2
			create editor_command_text
			create l_ev_vertical_box_2
			create editor_command_add_button
			create editor_command_browse_button
			create l_ev_horizontal_box_3
			create show_definition_tree_expanded_check_button
			create show_line_numbers_check_button
			create l_ev_horizontal_box_4
			create display_archetype_source_check_button
			create rm_checking_check_button
			create l_ev_horizontal_box_5
			create l_ev_label_1
			create parser_error_reporting_level_combo_box
			create l_ev_horizontal_box_6
			create l_ev_label_2
			create export_html_text
			create export_html_browse_button
			create l_ev_horizontal_box_7
			create l_ev_horizontal_box_8
			create l_ev_cell_1
			create ok_button
			create cancel_button
			
				-- Build widget structure.
			extend (l_ev_vertical_box_1)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_1)
			l_ev_vertical_box_1.extend (l_ev_frame_1)
			l_ev_frame_1.extend (l_ev_horizontal_box_2)
			l_ev_horizontal_box_2.extend (editor_command_text)
			l_ev_horizontal_box_2.extend (l_ev_vertical_box_2)
			l_ev_vertical_box_2.extend (editor_command_add_button)
			l_ev_vertical_box_2.extend (editor_command_browse_button)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_3)
			l_ev_horizontal_box_3.extend (show_definition_tree_expanded_check_button)
			l_ev_horizontal_box_3.extend (show_line_numbers_check_button)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_4)
			l_ev_horizontal_box_4.extend (display_archetype_source_check_button)
			l_ev_horizontal_box_4.extend (rm_checking_check_button)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_5)
			l_ev_horizontal_box_5.extend (l_ev_label_1)
			l_ev_horizontal_box_5.extend (parser_error_reporting_level_combo_box)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_6)
			l_ev_horizontal_box_6.extend (l_ev_label_2)
			l_ev_horizontal_box_6.extend (export_html_text)
			l_ev_horizontal_box_6.extend (export_html_browse_button)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_7)
			l_ev_vertical_box_1.extend (l_ev_horizontal_box_8)
			l_ev_horizontal_box_8.extend (l_ev_cell_1)
			l_ev_horizontal_box_8.extend (ok_button)
			l_ev_horizontal_box_8.extend (cancel_button)
			
			create string_constant_set_procedures.make (10)
			create string_constant_retrieval_functions.make (10)
			create integer_constant_set_procedures.make (10)
			create integer_constant_retrieval_functions.make (10)
			create pixmap_constant_set_procedures.make (10)
			create pixmap_constant_retrieval_functions.make (10)
			create integer_interval_constant_retrieval_functions.make (10)
			create integer_interval_constant_set_procedures.make (10)
			create font_constant_set_procedures.make (10)
			create font_constant_retrieval_functions.make (10)
			create pixmap_constant_retrieval_functions.make (10)
			create color_constant_set_procedures.make (10)
			create color_constant_retrieval_functions.make (10)
			l_ev_vertical_box_1.set_border_width (20)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_1)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_3)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_4)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_5)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_6)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_7)
			l_ev_vertical_box_1.disable_item_expand (l_ev_horizontal_box_8)
			l_ev_frame_1.set_text ("Editors")
			l_ev_horizontal_box_2.set_padding (10)
			l_ev_horizontal_box_2.set_border_width (10)
			l_ev_horizontal_box_2.disable_item_expand (l_ev_vertical_box_2)
			editor_command_text.set_tooltip ("Define one or more applications for editing .adls or .adl files.%NOne application per line.")
			l_ev_vertical_box_2.disable_item_expand (editor_command_add_button)
			l_ev_vertical_box_2.disable_item_expand (editor_command_browse_button)
			create internal_font
			internal_font.set_family ({EV_FONT_CONSTANTS}.Family_screen)
			internal_font.set_weight ({EV_FONT_CONSTANTS}.Weight_bold)
			internal_font.set_shape ({EV_FONT_CONSTANTS}.Shape_regular)
			internal_font.set_height_in_points (8)
			editor_command_add_button.set_font (internal_font)
			editor_command_add_button.set_text ("+")
			editor_command_add_button.set_tooltip ("Add another editor command")
			editor_command_browse_button.set_text ("Browse...")
			editor_command_browse_button.set_minimum_width (65)
			l_ev_horizontal_box_3.set_padding (10)
			l_ev_horizontal_box_3.set_border_width (10)
			show_definition_tree_expanded_check_button.set_text ("Show defiinition tree expanded?")
			show_line_numbers_check_button.set_text ("Show line numbers in ADL source?")
			l_ev_horizontal_box_4.set_padding (10)
			l_ev_horizontal_box_4.set_border_width (10)
			display_archetype_source_check_button.set_text ("Indicate original creation form?")
			rm_checking_check_button.set_text ("Turn RM checking on?")
			rm_checking_check_button.set_tooltip ("Turns reference model checking of archetypes, if a reference model schema is available")
			l_ev_horizontal_box_5.set_padding (10)
			l_ev_horizontal_box_5.set_border_width (10)
			l_ev_horizontal_box_5.disable_item_expand (l_ev_label_1)
			l_ev_horizontal_box_5.disable_item_expand (parser_error_reporting_level_combo_box)
			l_ev_label_1.set_text ("Parser error reporting level:")
			parser_error_reporting_level_combo_box.set_text ("Status Reporting Level")
			parser_error_reporting_level_combo_box.set_tooltip ("Select the level of parser messages to display. All levels >= this level displayed.")
			parser_error_reporting_level_combo_box.set_minimum_width (200)
			l_ev_horizontal_box_6.set_padding (10)
			l_ev_horizontal_box_6.set_border_width (10)
			l_ev_horizontal_box_6.disable_item_expand (l_ev_label_2)
			l_ev_horizontal_box_6.disable_item_expand (export_html_browse_button)
			l_ev_label_2.set_text ("Export HTML to:")
			color_constant_set_procedures.extend (agent export_html_text.set_background_color (?))
			color_constant_retrieval_functions.extend (agent editable_colour)
			export_html_text.set_minimum_width (300)
			export_html_browse_button.set_text ("Browse...")
			export_html_browse_button.set_minimum_width (65)
			l_ev_horizontal_box_8.set_padding (15)
			integer_constant_set_procedures.extend (agent l_ev_horizontal_box_8.set_border_width (?))
			integer_constant_retrieval_functions.extend (agent border_width)
			l_ev_horizontal_box_8.disable_item_expand (ok_button)
			l_ev_horizontal_box_8.disable_item_expand (cancel_button)
			l_ev_cell_1.set_minimum_width (100)
			ok_button.set_text ("OK")
			ok_button.set_minimum_width (100)
			ok_button.set_minimum_height (26)
			cancel_button.set_text ("Cancel")
			cancel_button.set_minimum_width (100)
			cancel_button.set_minimum_height (26)
			set_minimum_width (700)
			set_minimum_height (400)
			set_maximum_width (2000)
			set_maximum_height (800)
			set_title ("ADL Workbench Options")
			
			set_all_attributes_using_constants
			
				-- Connect events.
			editor_command_add_button.select_actions.extend (agent on_editor_command_add)
			editor_command_browse_button.select_actions.extend (agent on_editor_command_browse)
			export_html_browse_button.select_actions.extend (agent on_export_html_browse)
			ok_button.select_actions.extend (agent on_ok)

				-- Call `user_initialization'.
			user_initialization
		end


feature -- Access

	parser_error_reporting_level_combo_box: EV_COMBO_BOX
	l_ev_cell_1: EV_CELL
	editor_command_add_button, editor_command_browse_button,
	export_html_browse_button, ok_button, cancel_button: EV_BUTTON
	editor_command_text: EV_TEXT
	l_ev_horizontal_box_1,
	l_ev_horizontal_box_2, l_ev_horizontal_box_3, l_ev_horizontal_box_4, l_ev_horizontal_box_5,
	l_ev_horizontal_box_6, l_ev_horizontal_box_7, l_ev_horizontal_box_8: EV_HORIZONTAL_BOX
	l_ev_vertical_box_1,
	l_ev_vertical_box_2: EV_VERTICAL_BOX
	show_definition_tree_expanded_check_button, show_line_numbers_check_button,
	display_archetype_source_check_button, rm_checking_check_button: EV_CHECK_BUTTON
	l_ev_label_1, l_ev_label_2: EV_LABEL
	export_html_text: EV_TEXT_FIELD
	l_ev_frame_1: EV_FRAME

feature {NONE} -- Implementation

	is_in_default_state: BOOLEAN
			-- Is `Current' in its default state?
		do
			-- Re-implement if you wish to enable checking
			-- for `Current'.
			Result := True
		end
	
	user_initialization
			-- Feature for custom initialization, called at end of `initialize'.
		deferred
		end
	
	on_editor_command_add
			-- Called by `select_actions' of `editor_command_add_button'.
		deferred
		end
	
	on_editor_command_browse
			-- Called by `select_actions' of `editor_command_browse_button'.
		deferred
		end
	
	on_export_html_browse
			-- Called by `select_actions' of `export_html_browse_button'.
		deferred
		end
	
	on_ok
			-- Called by `select_actions' of `ok_button'.
		deferred
		end
	
	
feature {NONE} -- Constant setting

	set_attributes_using_string_constants
			-- Set all attributes relying on string constants to the current
			-- value of the associated constant.
		local
			s: STRING_GENERAL
		do
			from
				string_constant_set_procedures.start
			until
				string_constant_set_procedures.off
			loop
				string_constant_retrieval_functions.i_th (string_constant_set_procedures.index).call (Void)
				s := string_constant_retrieval_functions.i_th (string_constant_set_procedures.index).last_result
				string_constant_set_procedures.item.call ([s])
				string_constant_set_procedures.forth
			end
		end
		
	set_attributes_using_integer_constants
			-- Set all attributes relying on integer constants to the current
			-- value of the associated constant.
		local
			i: INTEGER
			arg1, arg2: INTEGER
			int: INTEGER_INTERVAL
		do
			from
				integer_constant_set_procedures.start
			until
				integer_constant_set_procedures.off
			loop
				integer_constant_retrieval_functions.i_th (integer_constant_set_procedures.index).call (Void)
				i := integer_constant_retrieval_functions.i_th (integer_constant_set_procedures.index).last_result
				integer_constant_set_procedures.item.call ([i])
				integer_constant_set_procedures.forth
			end
			from
				integer_interval_constant_retrieval_functions.start
				integer_interval_constant_set_procedures.start
			until
				integer_interval_constant_retrieval_functions.off
			loop
				integer_interval_constant_retrieval_functions.item.call (Void)
				arg1 := integer_interval_constant_retrieval_functions.item.last_result
				integer_interval_constant_retrieval_functions.forth
				integer_interval_constant_retrieval_functions.item.call (Void)
				arg2 := integer_interval_constant_retrieval_functions.item.last_result
				create int.make (arg1, arg2)
				integer_interval_constant_set_procedures.item.call ([int])
				integer_interval_constant_retrieval_functions.forth
				integer_interval_constant_set_procedures.forth
			end
		end
		
	set_attributes_using_pixmap_constants
			-- Set all attributes relying on pixmap constants to the current
			-- value of the associated constant.
		local
			p: EV_PIXMAP
		do
			from
				pixmap_constant_set_procedures.start
			until
				pixmap_constant_set_procedures.off
			loop
				pixmap_constant_retrieval_functions.i_th (pixmap_constant_set_procedures.index).call (Void)
				p := pixmap_constant_retrieval_functions.i_th (pixmap_constant_set_procedures.index).last_result
				pixmap_constant_set_procedures.item.call ([p])
				pixmap_constant_set_procedures.forth
			end
		end
		
	set_attributes_using_font_constants
			-- Set all attributes relying on font constants to the current
			-- value of the associated constant.
		local
			f: EV_FONT
		do
			from
				font_constant_set_procedures.start
			until
				font_constant_set_procedures.off
			loop
				font_constant_retrieval_functions.i_th (font_constant_set_procedures.index).call (Void)
				f := font_constant_retrieval_functions.i_th (font_constant_set_procedures.index).last_result
				font_constant_set_procedures.item.call ([f])
				font_constant_set_procedures.forth
			end	
		end
		
	set_attributes_using_color_constants
			-- Set all attributes relying on color constants to the current
			-- value of the associated constant.
		local
			c: EV_COLOR
		do
			from
				color_constant_set_procedures.start
			until
				color_constant_set_procedures.off
			loop
				color_constant_retrieval_functions.i_th (color_constant_set_procedures.index).call (Void)
				c := color_constant_retrieval_functions.i_th (color_constant_set_procedures.index).last_result
				color_constant_set_procedures.item.call ([c])
				color_constant_set_procedures.forth
			end
		end
		
	set_all_attributes_using_constants
			-- Set all attributes relying on constants to the current
			-- calue of the associated constant.
		do
			set_attributes_using_string_constants
			set_attributes_using_integer_constants
			set_attributes_using_pixmap_constants
			set_attributes_using_font_constants
			set_attributes_using_color_constants
		end
					
	string_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [STRING_GENERAL]]]
	string_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], STRING_GENERAL]]
	integer_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [INTEGER]]]
	integer_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], INTEGER]]
	pixmap_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_PIXMAP]]]
	pixmap_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_PIXMAP]]
	integer_interval_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], INTEGER]]
	integer_interval_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [INTEGER_INTERVAL]]]
	font_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_FONT]]]
	font_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_FONT]]
	color_constant_set_procedures: ARRAYED_LIST [PROCEDURE [ANY, TUPLE [EV_COLOR]]]
	color_constant_retrieval_functions: ARRAYED_LIST [FUNCTION [ANY, TUPLE [], EV_COLOR]]
	
	integer_from_integer (an_integer: INTEGER): INTEGER
			-- Return `an_integer', used for creation of
			-- an agent that returns a fixed integer value.
		do
			Result := an_integer
		end

end
