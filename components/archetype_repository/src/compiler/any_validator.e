indexing
	component:   "openEHR Archetype Project"
	description: "[
				 General idea of a validator object that reports errors, warnings.
				 ]"
	keywords:    "ADL, archetype"
	author:      "Thomas Beale"
	support:     "Ocean Informatics <support@OceanInformatics.biz>"
	copyright:   "Copyright (c) 2007 Ocean Informatics Pty Ltd"
	license:     "See notice at bottom of class"

	file:        "$URL$"
	revision:    "$LastChangedRevision$"
	last_change: "$LastChangedDate$"


deferred class ANY_VALIDATOR

inherit
	MESSAGE_BILLBOARD
		export
			{NONE} all
		end

feature -- Initialisation

	make(a_target: like target) is
			-- set target
			-- initialise reporting variables
		require
			Target_valid: a_target /= Void
		do
			target := a_target
			create errors.make(0)
			create warnings.make(0)
		end

feature -- Access

	target: ANY

	errors: STRING
			-- error output of validator

	warnings: STRING
			-- warnings output of validator

feature -- Status Report

	passed: BOOLEAN
			-- True if validation succeeded

	has_warnings: BOOLEAN is
			-- True if warnings from last call to validate
		do
			Result := warnings /= Void and then not warnings.is_empty
		end

feature -- Validation

	validate is
		deferred
		end

invariant
	Errors_exists: errors /= Void
	Warnings_exists: warnings /= Void

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
--| The Original Code is any_validator.e.
--|
--| The Initial Developer of the Original Code is Thomas Beale.
--| Portions created by the Initial Developer are Copyright (C) 2007
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