# Selecting a depot_tools commit


After cloning **depot_tools** in the instructions below, checkout the commit
**5ba2fb94f5ceb4383f528e70183d4c8286c1c171** before proceeding.


# Building Edge Project for Windows


This document will be referencing sections of the Chromium build instructions at
[windows_build_instructions.md](windows_build_instructions.md), and will only directly include the differences.

1.  Follow the instructions under the **Setting up Windows** header in
    [windows_build_instructions.md](windows_build_instructions.md).
2.  Follow the instructions under the **Install depot_tools** header in
    [windows_build_instructions.md](windows_build_instructions.md), placing the **depot_tools** folder adjacent to the
    extracted **src** folder.
3.  Create an environment variable named `EDGE_ROOT` and set the value to the directory where you unzipped the file.
    If the extracted folder path has spaces, please replace it with underscores before creating this variable.
4.  Open a command prompt.
5.  Run the script `%EDGE_ROOT%\depot_tools\bootstrap\win_tools.bat`.
6.  Run the command `cd %EDGE_ROOT%\src`.
7.  Run the command:

    ```
    python build\toolchain\win\setup_toolchain.py "[Visual Studio path]" "[Win SDK Path]" "%EDGE_ROOT%\src\out\Release" win [Architecture] "%EDGE_ROOT%\src\out\Release\environment.[Architecture]"
    ```

    Replace `[Visual Studio path]`, `[Win SDK Path]`, `[Architecture]` with values specific to your setup and build you
    want to produce. Please note that if you want an architecture other than x64 you will have to run this command for
    that architecture and then run it again for x64, as cross-compilation needs these values to work properly. For
    example:

    ```
    python build\toolchain\win\setup_toolchain.py "C:\Program Files (x86)\Microsoft Visual Studio\2017\Community" "c:\Program Files (x86)\Windows Kits\10" "%EDGE_ROOT%\src\out\Release" win x64 "%EDGE_ROOT%\src\out\Release\environment.x64"
    ```

8.  Run the command `python -m pip install pywin32`.
9.  Run the command `cd %EDGE_ROOT%\src\out\Release`.
10. Create an environment variable named `RBE_offline` and set the value 1
11. Run the command `ninja`.
12. Run the command `ninja -f link.ninja`.
13. On Windows 10 RS5 and above the following must be ran from an elevated command prompt to ensure that the render process is allowed to run in an appcontainer.
    1. `icacls %EDGE_ROOT%\src\out\Release /grant "*S-1-15-2-2:(OI)(CI)(RX)"`
14. Run **msedge.exe** to launch Edge.


# Building Edge Project for Mac OS


This document will be referencing sections of the Chromium build instructions at
[mac_build_instructions.md](mac_build_instructions.md), and will only directly include the differences.

Note regarding security permissions: When running `ninja` below in steps 8-9, you may need to grant permissions to
the terminal app you are using in **Security & Privacy** settings or override the security blocks for some programs
that run as part of building (e.g. `clang`, `dsymutil`).

1.  Follow the instructions under the **System requirements** header in
    [mac_build_instructions.md](mac_build_instructions.md).
2.  Follow the instructions under the **Install depot_tools** header in
    [mac_build_instructions.md](mac_build_instructions.md), placing the **depot_tools** folder adjacent to the
    extracted **src** folder.
3.  Create an environment variable named `EDGE_ROOT` and set the value to the directory where you unzipped the file.
4.  Open a terminal window.
5.  The XCode version used when building assumes a hardcoded path. Two possible options are:
    1. Rename your XCode file to `/Applications/XCode_16e140.app` for this build.
    2. Create a symbolic link to the default installation path e.g.
    `ln -s /Applications/Xcode.app /Applications/Xcode_16e140.app`
6.  Run the command `cd $EDGE_ROOT/src/out/Release`.
7.  Run the command `python $EDGE_ROOT/src/build/config/apple/sdk_info.py --get_sdk_info --create_symlink_at sdk/xcode_links macosx`.
8. Create an environment variable named `RBE_offline` and set the value 1
9.  Run the command `ninja`. Please note the security permissions above - this command may fail the first few runs.
10.  Run the command `ninja -f link.ninja`. Please note the security permissions above - this command may fail the first
    few runs.
11. Open the app with `open "./Microsoft Edge.app"`, overriding the security block if necessary.


# Building Edge Project for iOS


This document will be referencing sections of the Chromium build instructions at
[ios/build_instructions.md](ios/build_instructions.md), and will only directly include the differences.

Note regarding security permissions: When running `ninja` below in steps 8-9, you may need to grant permissions to
the terminal app you are using in **Security & Privacy** settings or override the security blocks for some programs
that run as part of building (e.g. `clang`, `dsymutil`).

1.  Follow the instructions under the **System requirements** header in
    [ios/build_instructions.md](ios/build_instructions.md).
2.  Follow the instructions under the **Install depot_tools** header in
    [ios/build_instructions.md](ios/build_instructions.md), placing the **depot_tools** folder adjacent to the extracted
    **src** folder.
3.  Create an environment variable named EDGE_ROOT and set the value to the directory where you unzipped the file.
4.  Open a terminal window.
5.  The XCode version used when building assumes a hardcoded path. Two possible options are:
    1. Rename your XCode file to `/Applications/XCode_16e140.app` for this build.
    2. Create a symbolic link to the default installation path e.g.
    `ln -s /Applications/Xcode.app /Applications/Xcode_16e140.app`
6.  Run the command `cd $EDGE_ROOT/src/out/Release`.
7.  Run the command `python $EDGE_ROOT/src/build/config/apple/sdk_info.py --get_sdk_info --create_symlink_at sdk/xcode_links iphoneos`.
8. Create an environment variable named `RBE_offline` and set the value 1
9.  Run the command `ninja`. Please note the security permissions above - this command may fail the first few runs.
10.  Run the command `ninja -f link.ninja`. Please note the security permissions above - this command may fail the first
    few runs.
11. See **Code signing identity** in [ios/build_instructions.md](ios/build_instructions.md) for information about
    signing the package to allow for sideloading.
12. Launch the Edge app.


# Building Edge Project for Linux


This document will be referencing sections of the Chromium build instructions at
[linux/build_instructions.md](linux/build_instructions.md), and will only directly include the differences.

1.  Follow the instructions under the **System requirements** header in
    [linux/build_instructions.md](linux/build_instructions.md).
2.  Follow the instructions under the **Install depot_tools** header in
    [linux/build_instructions.md](linux/build_instructions.md), placing the **depot_tools** folder adjacent to the
    extracted **src** folder.
3.  Follow the instructions under the **Install additional build dependencies** subheader in
    [linux/build_instructions.md](linux/build_instructions.md).
4.  Create an environment variable named `EDGE_ROOT` and set the value to the directory where you unzipped the file.
5.  Open a terminal window.
6.  Run the command `cd $EDGE_ROOT/src/out/Release`.
7. Create an environment variable named `RBE_offline` and set the value 1
8.  Run the command `ninja`.
9.  Run the command `ninja -f link.ninja`.
10.  Run **msedge** to launch Edge.


# Building Edge Project for Android


This document will be referencing sections of the Chromium build instructions at
[android_build_instructions.md](android_build_instructions.md), and will only directly include the differences.

1.  Follow the instructions under the **System requirements** header in
    [android_build_instructions.md](android_build_instructions.md).
2.  Follow the instructions under the **Install depot_tools** header in
    [android_build_instructions.md](android_build_instructions.md), placing the **depot_tools** folder adjacent to the
    extracted **src** folder.
3.  Create an environment variable named `EDGE_ROOT` and set the value to the directory where you unzipped the file.
4.  Open a terminal window.
5.  Run the command `cd $EDGE_ROOT/src/out/Release`.
6. Create an environment variable named `RBE_offline` and set the value 1
7.  Run the command `ninja`.
8.  Run the command `ninja -f link.ninja`.
9.  Prepare your device for launching Edge - Follow the instructions under the **Plug in your Android device** and
    **Enable apps from unknown sources** section in [android_build_instructions.md](android_build_instructions.md). For
    instructions on running the commands starting with `third_party/android_sdk` - the Android SDK can be installed
    separately at https://developer.android.com/studio/.
10.  Install Edge using **ChromePublic-external.apk** either by copying the file over to your device and installing it
    there or using the `adb shell` (if installed) e.g. `adb install ChromePublic-external.apk`.
11. Launch the Edge app.

Source code for portions of Microsoft Edge is available free of charge from https://thirdpartysource.microsoft.com
under the third party open source license terms provided at http://aka.ms/thirdpartynotices and in Microsoft Edge at
edge://credits after installation. Or to obtain source code you may send a check or money order for US $5.00, including
the Edge version number, to:

Source Code Compliance Team  
Microsoft Corporation  
One Microsoft Way  
Redmond, WA 98052  
USA
