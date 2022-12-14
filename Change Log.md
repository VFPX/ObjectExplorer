# Object Explorer Change Log

### 2022-12-14, Version 3.3.7.2

* Added description in the options page of Thor Configuration
* Moved most of Updater file contents to Version file, eliminating need for Thor update.

### 2022-12-13, Version 3.3.7.1

* New: Option to assign object being explored into a public variable
* New: Name of the public variable is set in the options page of Thor Configuration
* New: The variable is released when Object Explorer closes.
* New: Right-click context menu in the TreeView on left allows you to assign any object in the tree into the public variable

### 2022-11-23, Version 3.3.6

* New: Double click now works on any column in the grid to edit property values.  
* New: Right-click on grid row brings up context menu to edit property (same as double-click) or to toggle whether the property is a favorite
* New: Checkbox for whether favorites are highlighted (with yellow highlighter)

### 2022-05-22, Version 3.3.3

* Add a TRY in TreeContainer.Init so no error if _Screen.oISXOptions.oKeyWordList doesn't exist

### 2022-04-04

* Updated the download zip file so it works with Thor Check for Updates.

### 2022-04-03

* Fixes a bug with an object based on Control in a running form and updates the displayed version number.

### 2022-04-02

* Fixes a bug with null nodes, such as with an object based on Empty or Control.

### 2022-03-04

* Automatically closes when the object being explored is released, and no longer prevents the object from being released

### 2022-03-03

* Changed hard-coded "explorer.vcx" in NEWOBJECT() statements to This.ClassLibrary so pathing isn't an issue.

* Set AllowOutput to .F. in forms.

* Ensure the explorer form is visible by being positioned within _screen or the active form, depending on the setting of ShowWindow.

* Added support for Thor Check For Updates.

### 2022-02-28

* Initial release: Jim and Matt's original version plus the following changes by Doug Hennig:

    * TreeContainer.NewNode: accept toParentNode and use the appropriate version of Nodes.Add if it's an object. This change (and the next one) prevents cashing for some objects (the TreeView was getting cranky when changing the Parent property of a node).

    * TreeContainer.LoadObject and LoadOtherObject: call NewNode rather than using their own Nodes.Add calls.

    * TreeContainer.NavigateToObject: specifically set loNode.Expanded to .T. because calling Expand doesn't necessary do that, also call loNode.EnsureVisible to ensure the TreeView is scrolled to the node. This fixes an issue with not automatically selecting the correct object in the TreeView at startup: the form was selected rather than the object, although the grid showed the properties for the correct object.

    * TreeContainer.InputBox: use InputBox_ShowWindow1 if the form is in a top-level form, not if it's modal. This change (and the next one) allows Object Explorer to be used in apps with _screen.Visible set to .F. and using top-level forms.

    * InputBox_ShowWindow1: set Desktop to .T. This doesn't affect apps with _screen.Visible =  .T. but does allow it to work when it's .F.

