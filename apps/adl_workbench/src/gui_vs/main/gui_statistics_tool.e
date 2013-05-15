note
	component:   "openEHR Archetype Project"
	description: "GUI Statistics Tool"
	keywords:    "ADL, archetype workbench"
	author:      "Thomas Beale <thomas.beale@OceanInformatics.com>"
	support:     "http://www.openehr.org/issues/browse/AWB"
	copyright:   "Copyright (c) 2011 Ocean Informatics Pty Ltd <http://www.oceaninfomatics.com>"
	license:     "See notice at bottom of class"

class GUI_STATISTICS_TOOL

inherit
	GUI_CATALOGUE_TARGETTED_TOOL

create
	make

feature {NONE} -- Initialisation

	make
		do
			-- create root widget
			create ev_root_container
			create ev_stats_info_frame
			create ev_term_bindings_info_frame
			create ev_stats_mlist
			create ev_term_bindings_info_list

			-- connect them together
			ev_root_container.extend (ev_stats_info_frame)
			ev_stats_info_frame.extend (ev_stats_mlist)
			ev_root_container.extend (ev_term_bindings_info_frame)
			ev_term_bindings_info_frame.extend (ev_term_bindings_info_list)

			-- set visual characteristics
			ev_root_container.set_padding (Default_padding_width)
			ev_root_container.set_border_width (Default_border_width)
			ev_root_container.disable_item_expand (ev_stats_info_frame)
			ev_stats_info_frame.set_text (get_msg (ec_stats_frame_text, Void))
			ev_term_bindings_info_frame.set_text (get_msg (ec_term_bindings_frame_text, Void))
			ev_term_bindings_info_list.set_column_titles (<<"terminology", "archetypes">>)

			ev_root_container.set_data (Current)
		end

feature -- Access

	ev_root_container: EV_VERTICAL_BOX

feature {NONE} -- Implementation

	do_clear
		do
			ev_stats_mlist.wipe_out
			ev_term_bindings_info_list.wipe_out
		end

	do_populate
			-- Populate the statistics tab.
		local
			list_row: EV_MULTI_COLUMN_LIST_ROW
		do
			-- archetype metrics list
			ev_stats_mlist.set_column_titles (
				<<get_msg (ec_summary_list_metric_col_title, Void),
				get_msg (ec_summary_list_total_col_title, Void)>>
			)
			populate_ev_multi_list_from_hash (ev_stats_mlist, source.catalogue_metrics)
			ev_stats_info_frame.set_minimum_height ((ev_stats_mlist.count + 3) * ev_stats_mlist.row_height)

			-- do terminology bindings statistics
			across source.terminology_bindings_statistics as stats_csr loop
				from ev_term_bindings_info_list.start until ev_term_bindings_info_list.off or
					ev_term_bindings_info_list.item.first.is_equal (stats_csr.key)
				loop
					ev_term_bindings_info_list.forth
				end
				if not ev_term_bindings_info_list.off then
					ev_term_bindings_info_list.item.finish
					ev_term_bindings_info_list.item.remove
					ev_term_bindings_info_list.item.extend (utf8_to_utf32 (stats_csr.item.count.out))
				else
					create list_row
					list_row.extend (utf8_to_utf32 (stats_csr.key))
					list_row.extend (utf8_to_utf32 (stats_csr.item.count.out))
					ev_term_bindings_info_list.extend (list_row)
				end
			end
			resize_ev_multi_list_to_headers (ev_term_bindings_info_list)
		end

	ev_stats_info_frame, ev_term_bindings_info_frame: EV_FRAME

	ev_stats_mlist, ev_term_bindings_info_list: EV_MULTI_COLUMN_LIST

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
--| The Original Code is gui_statistics_tool.e
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2011
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