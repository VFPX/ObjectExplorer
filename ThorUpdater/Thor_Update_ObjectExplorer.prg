lparameters toUpdateObject
local lcAppName, ;
	lcAppID, ;
	lcRepositoryURL, ;
	lcDownloadsURL, ;
	lcVersionFileURL, ;
	lcZIPFileURL, ;
	lcRegisterWithThor

* Set the project settings; edit these for your specific project.

lcAppName       = 'Object Explorer'
	&& the name of the project
lcAppID         = 'ObjectExplorer'
	&& similar to lcAppName but must be URL-friendly (no spaces or other
	&& illegal URL characters)
lcRepositoryURL = 'https://github.com/VFPX/ObjectExplorer'
	&& the URL for the project's repository

* If the version file and zip file are in the ThorUpdater folder of the
* master branch of a GitHub repository, these don't need to be edited.
* Otherwise, set lcVersionFileURL and lcZIPFileURL to the correct URLs.

lcDownloadsURL   = strtran(lcRepositoryURL, 'github.com', ;
	'raw.githubusercontent.com') + '/master/ThorUpdater/'
lcVersionFileURL = lcDownloadsURL + lcAppID + 'Version.txt'
	&& the URL for the file containing code to get the available version number
lcZIPFileURL     = lcDownloadsURL + lcAppID + '.zip'
	&& the URL for the zip file containing the project

* This is code to execute after the project has been installed by Thor for the
* first time. Edit this if you want do something different (such as running
* the installed code) or display a different message. You can use code like
* this if you want to execute the installed code; Thor replaces
* ##InstallFolder## with the installation path for the project:
*
* 'do "##InstallFolder##MyProject.prg"'

text to lcRegisterWithThor noshow textmerge
	messagebox('From the Thor menu, choose "More -> Open Folder -> Apps" to see the folder where <<lcAppName>> was installed', 0, '<<lcAppName>> Installed', 5000)

* Create the tool under Thor Tools.

	loThorInfo = Execscript (_Screen.cThorDispatcher, 'Thor Register=')
	with loThorInfo

* Required properties.

		.PRGName    = 'Thor_Tool_ObjectExplorer'
		.FolderName = '##InstallFolder##'
		.Prompt     = '<<lcAppName>>'

* Optional properties.

		.Description = '<<lcAppName>>'

* These are used to group and sort tools when they are displayed in menus or the Thor form.

		.Category        = 'Applications'
		.CanRunAtStartUp = .F.

* This is the code to execute when the tool is selected.

		.Code = "do form ('##InstallFolder##Explorer') with sys(1270)"

* Register the tool with Thor.

		llRegister = .Register()
	endwith
endtext

* Set the properties of the passed updater object. You likely won't need to edit this code.

with toUpdateObject
	.ApplicationName      = lcAppName
	.Component            = 'No'
	.VersionLocalFilename = lcAppID + 'VersionFile.txt'
	.RegisterWithThor     = lcRegisterWithThor
	.VersionFileURL       = lcVersionFileURL
	.SourceFileUrl        = lcZIPFileURL
	.Link                 = lcRepositoryURL
	.LinkPrompt           = lcAppName + ' Home Page'
	.Notes                = GetNotes()
endwith
return toUpdateObject

* Get the notes for the project. Edit this code as necessary.

procedure GetNotes
local lcNotes
text to lcNotes noshow
Object Explorer

Provides an explorer form to view members of the specified object.
endtext
return lcNotes
