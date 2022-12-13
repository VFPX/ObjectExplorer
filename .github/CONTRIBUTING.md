# How to contribute to Object Explorer

## Bug report?
- Please check [issues](https://github.com/VFPX/ObjectExplorer/issues) if the bug is reported
- If you're unable to find an open issue addressing the problem, open a new one. Be sure to include a title and clear description, as much relevant information as possible, and a code sample or an executable test case demonstrating the expected behavior that is not occurring.

### Did you write a patch that fixes a bug?
- Open a new GitHub merge request with the patch.
- Ensure the PR description clearly describes the problem and solution.
  - Include the relevant version number if applicable.
- See [New version](#new-version) for additional tasks

## New version
Here are the steps to updating to a new version:

1. Please create a fork at github
   - See this [guide](https://www.dataschool.io/how-to-contribute-on-github/) for setting up and using a fork
2. Make whatever changes are necessary.
2. Run FoxBin2Prg to create the text files.
   - `DO foxbin2prg.prg WITH 'BIN2PRG','*.*'`
2. Set version and date in property _cVersion_ in class _treecontainer of explorer.vcx_, 
5. Describe the changes in the top of _Change Log.md_.
6. Alter the footer of \*.md files touched to recent date.
7. In the _.\ThorUpdater_ folder:
* Edit the majorVersion setting in Project.txt
* Right-click CreateThorUpdate.ps1 and select Run with PowerShell from the shortcut menu to update ObjectExplorerVersion.txt and ObjectExplorer.zip
8. Commit
9. Push to your fork
10. Create a pull request

----
Last changed: _2022/05/22_ ![Picture](../Docs/Images/vfpxpoweredby_alternative.gif)
