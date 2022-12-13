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

Local lcClassDefinitions, lcCode, lcDefineStatements, lcDescription

lcDescription	   = GetDescription()
lcDefineStatements = GetDefineStatements()
lcCode			   = GetCode()
lcClassDefinitions = GetClassDefinitions()

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

		<< 'Text to .Description NoShow' >>
<<lcDescription>>
		<< 'EndText' >>

* These are used to group and sort tools when they are displayed in menus or the Thor form.

		.Category        = 'Applications'
		.CanRunAtStartUp = .F.

		.OptionClasses      = 'clsPublicVariableNameProperties' 
		.OptionTool         = '<<lcAppName>>'

* This is the code to execute when the tool is selected.
		<< 'Text To .DefineStatements Noshow '>>
<<lcDefineStatements>>
		<< 'Endtext' >>

		<< 'Text To .Code Noshow '>>
<<lcCode>>
		<< 'Endtext' >>

		<< 'Text To .ClassDefinitions Noshow '>>
<<lcClassDefinitions >>
		<< 'Endtext' >>
		
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

* ================================================================================
* ================================================================================

* Get the notes for the project. Edit this code as necessary.

Procedure GetNotes
	Local lcNotes

	Text To m.lcNotes Noshow
Object Explorer

Provides an explorer form to view members of the specified object.
	Endtext
	Return m.lcNotes
EndProc 




* ================================================================================
* ================================================================================
Procedure GetDescription
	Local lcDescription

	Text To m.lcDescription Noshow
Object Explorer
	Endtext

	Return Evl(m.lcDescription, '')
EndProc


* ================================================================================
* ================================================================================
Procedure GetDefineStatements
	Local lcDefineStatements

	Text To m.lcDefineStatements Noshow PreText 7
	#Define ccTool 'Object Explorer'
	#Define ccKey  'Public Variable Name'
	#Define CRLF   Chr[13] + chr[10]
	EndText 
	Return Evl(m.lcDefineStatements, '')
EndProc


* ================================================================================
* ================================================================================
Procedure GetCode
	Local lcCode

	Text To m.lcCode Noshow
	Local lcPublicVariable, loException, loObject

	If Vartype(m.lxParam1) # 'O'
		loObject = Sys(1270)
		If Vartype(m.loObject) # 'O'
			Return
		Endif
	Else
		loObject = m.lxParam1
	Endif

	lcPublicVariable = Nvl(Execscript(_Screen.cThorDispatcher, 'Get Option=', ccKey, ccTool), '')
	If Not Empty(m.lcPublicVariable)
		Try
			Release &lcPublicVariable
			Public &lcPublicVariable
			&lcPublicVariable = m.loObject
		Catch To m.loException
			lcPublicVariable = ''
		Endtry
	Endif

	Do form ('##InstallFolder##Explorer') with Sys(1270), , , m.lcPublicVariable

	EndText 
	Return Evl(m.lcCode, '')
EndProc


* ================================================================================
* ================================================================================
Procedure GetClassDefinitions
	Local lcClassDefinitions

	Text To m.lcClassDefinitions Noshow


****************************************************************
****************************************************************
Define Class clsPublicVariableNameProperties As Custom

	Tool		  = ccTool
	Key			  = ccKey
	Value		  = ''
	EditClassName = 'clsPublicVariableName'

Enddefine


****************************************************************
****************************************************************
Define Class clsPublicVariableName As Container

	Procedure Init
		Local lcBodyMarkup, loRenderEngine
		loRenderEngine = Execscript(_Screen.cThorDispatcher, 'Class= OptionRenderEngine')

		lcBodyMarkup =												;
			[.Class	  = 'Label'] 				 	+ CRLF +		;
			[.Caption  = 'Public Variable Name'] 	+ CRLF +		;
			[.AutoSize = .T.] 						+ CRLF +		;
			[.Top	  = (.Top + 8)] 				+ CRLF +		;
			[|] 									+ CRLF +		;
			[.Class = 'TextBox']					+ CRLF +		;
			[.cTool = ccTool] 						+ CRLF +		;
			[.cKey  = ccKey] 						+ CRLF +		;
			[.Width = 120] 							+ CRLF +		;
			[.Row-Increment = 0]					+ CRLF +		;
			[.Top = (.Top - 4)]
						
		loRenderEngine.cBodyMarkup = lcBodyMarkup
		loRenderEngine.Render(This, 'Object Explorer')

	Endproc

Enddefine
	
	EndText 
	
	Return Evl(m.lcClassDefinitions, '')
EndProc


