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

1. Create a fork at github
   - See this [guide](https://www.dataschool.io/how-to-contribute-on-github/) for setting up and using a fork
2. Make whatever changes are necessary.
---
3. Set version and date in property _cVersion_ in class _treecontainer_ of _explorer.vcx_, 
5. Run FoxBin2Prg to create the text files in folder _Installed Files_
   - `DO foxbin2prg.prg WITH 'BIN2PRG','*.*'`
2. Update the version and date in top few lines and at the very bottom of _ReadMe.md_ 
7. Describe the changes in the top of _Change Log.md_.
6. In folder _ThorUpdater_:
    - Edit the majorVersion and versionDate settings in _Project.txt_
    - Right-click _CreateThorUpdate.ps1_ and select **Run with PowerShell** from the shortcut menu to re-create _ObjectExplorerVersion.txt_ and _ObjectExplorer.zip_
---
8. Commit
9. Push to your fork
10. Create a pull request

----
Last changed: _2022/12/26_ ![Picture](../Docs/Images/vfpxpoweredby_alternative.gif)