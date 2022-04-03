# How to contribute to Thor

## Bug report?
- Please check [issues](https://github.com/VFPX/Thor/issues) if the bug is reported
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
2. Set version and date in property _cVersion_ in class _treecontainer of explorer.vcx_, 
2. run FoxBin2Prg to create the text files.
5. Update the version number at the top of _README.md_ and describe the changes in the What's New section near the bottom.
6. Please alter the footer of \*.md files touched to recent date.
1. Change Thor (see below)
9. commit
9. push to your fork
0. create a pull request

## Thor conventions
This project is part of [VFPX](https://vfpx.github.io/) and published via [Thor](https://github.com/VFPX/Thor).   
There are some considerations to make to add a new version to Thor.   
In Folder _.\ThorUpdater_
- _ObjectExplorerVersion.txt_ set up version information and brief list of changes
- _ObjectExplorer.zip_
  - add sources changed, please only the binaries

Thanks

----
Last changed: _2022/04/03_ ![Picture](../Docs/Images/vfpxpoweredby_alternative.gif)
