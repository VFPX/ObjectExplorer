* Registered with Thor: 10/16/17 01:50:37 PM
Lparameters lxParam1

****************************************************************
****************************************************************
* Standard prefix for all tools for Thor, allowing this tool to
*   tell Thor about itself.

If Pcount() = 1						  ;
		And 'O' = Vartype (lxParam1)  ;
		And 'thorinfo' = Lower (lxParam1.Class)

	With lxParam1

		* Required
		.Prompt             = 'Object Explorer' && used when tool appears in a menu
		.Description        = 'Object Explorer'
		.PRGName            = 'Thor_Tool_ObjectExplorer' && a unique name for the tool; note the required prefix

		* Optional 
		.FolderName         = 'D:\DEVELOPMENT\TOOLS\THOR\Thor\Tools\Apps\ObjectExplorer\' && folder name for APP   
		.CanRunAtStartup    = .F. 

		* For public tools, such as PEM Editor, etc.
		.Category           = 'Applications' 
	Endwith

	Return lxParam1
Endif

If Pcount() = 0
	Do ToolCode
Else
	Do ToolCode With lxParam1
Endif

Return

****************************************************************
****************************************************************
* Normal processing for this tool begins here.                  
Procedure ToolCode
    Lparameters lxParam1
do form ('D:\DEVELOPMENT\TOOLS\THOR\Thor\Tools\Apps\ObjectExplorer\Explorer.scx') with sys(1270)
EndProc 
