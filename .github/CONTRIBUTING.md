# How to contribute to Thor

## Bug report?
- Please check [issues](https://github.com/VFPX/Thor/issues) if the bug is reported
- If you're unable to find an open issue addressing the problem, open a new one. Be sure to include a title and clear description, as much relevant information as possible, and a code sample or an executable test case demonstrating the expected behavior that is not occurring.

## New version
Here are the steps to updating to a new version:

1. Please create a fork at github
2. Make whatever changes are necessary.
3. Edit _ThorVersion.h_ and change the version constants.
4. Build _Thor_.app using VFP 9, not VFP Advanced, since the APP structure is different. Save the app in the parent folder of the Source folder; that is, in the Thor folder.
5. Update the version number at the top of _README.md_ and describe the changes in the What's New section near the bottom.
6. Update the AvailableVersion property in _ThorUpdater\\_ThorVersionFile.txt_: note the format of the value must be identical to the value of the `ccThorInternalVERSION` constant in _ThorVersion.h_.
7. Update or recreate _ThorUpdater\Thor.zip_: it should contain the contents of the Thor folder; that is, the _Source_ folder and _Thor.app_.
9. push to your fork
0. create a pull request

## Thor conventions
This project is part of [VFPX](https://vfpx.github.io/) and published via [Thor](https://github.com/VFPX/Thor).   
There are some considerations to make to add a new version to Thor.   
In Folder _downloads\ThorUpdater_
- _ObjectExplorerVersion.txt_ set up version information and brief list of changes
- _ObjectExplorer.zip_
  - copy _ObjectExplorerVersion.txt_ and sources changed


----
Last changed: _2022/04/01_ ![Picture](../Docs/Images/vfpxpoweredby_alternative.gif)