Tangible Gold
Version: 1.1.0
Author: MrJack

Table of contents
- Description
- Requirements
- Compatibility
- How to install
- How to uninstall
- Known issues
- Credits
- How to contact the author
- Changelog


--Description--
Tangible Gold makes in-game currency show up in the inventory menu as separate item and in-game currency can be dropped from the inventory menu.


--Requirements--
Skyrim (>= 1.9.32.0.8)
SKSE (Minimum: >= 1.5.11, recommended: >= 1.7.1)

Version 1.5.11 of SKSE is required for basic functionality, but version 1.7.1 is required to support the case where Gold001 is not set as the in-game currency.


--Compatibility--
Changes done to Gold001 by other mods, as long as the change isn't done at runtime, are compatible. If you have an SKSE version older than 1.7.1, then only weight, name, and value are copied from Gold001. If you have version 1.7.1 (or newer) of SKSE installed, then weight, name, value, and model are copied from the form designated in Default Object Manager as the in-game currency.


--How to install--
1. Extract all files to "\Skyrim\Data" or install with your favorite mod manager.
2. Activate Tangible Gold.esp.


--How to uninstall--
Uninstalling this mod in the middle of a playthrough is not officially supported. Once the files have been removed, then you should either start a new game
or revert to a save that has not seen this mod.

Remove the following files:
\Skyrim\Data\Tangible Gold.esp
\Skyrim\Data\Tangible Gold.bsa


--Known issues--
The process of copying the name of the in-game currency to the dummy item, which is shown in the inventory, may result in the dummy form having a name with only lower-case letters, upper-case letters, or an unexpected mix of lower-case and upper-case letters. This is due to the way strings are stored by the game engine.


--Credits--
The entire SKSE team for making this mod possible.
Dienes for helping.


--How to contact the author--
PM MrJack on the official Bethesda forums or mrpwn on Nexus.


--Changelog--
1.1.0:
	- Added the ability to drop stacks of gold as a coin purse. Dropping more than 10 coins at once leads to a coin purse being dropped.
1.0.0:
	- Initial release.