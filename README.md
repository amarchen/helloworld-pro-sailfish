Sailfish app with QML test
=========

A minimal project for demonstrating the project structure with a simple app and a couple of QML tests that verify stuff in both UI level and under UI level. In the bright future it might be the ideal super-polished good app template with all the minimal stuff you need in real app, but nothing else. Works with Sailfish OS update 10 (from Dec 2014)

Quick-start your own app
------------

1. git clone or download sources.

2. To rename the application, goto command line and run `python rename-to-my-project.py harbour-mycoolapp`

 The rename script needs Python to be installed to your machine. Python version >= 2.5 should work. To check all options on rename script run `python rename-to-my-project.py --help`.
 
 By default rename script ignores the rename script itself and `.git` directory, but you can affect ignored files and directories with `ignoredFiles` and `ignoredDirs` arguments. Also you can change you application name multiple times to something different by using `originalName` argument (as originalName is defaulted to harbour-helloworld-pro-sailfish).
 Example: `python rename-to-my-project.py --originalName harbour-mycoolapp harbour-mycoolapp-withbettername --ignoredDirs .git .setttings myOwnstuffDir --ignoredFiles rename-to-my-project.py myDevNotes.txt app.log`. 

3. Ensure that you have the SailfishOS SDK installed. Choose either the SailfishOS IDE version (more clicking) or the command line version (more typing) of the following build and installation sections.

Build and installation (SailfishOS IDE version)
------------

### Running app
1. Import to SailfishOS IDE (aka Qt Creator): File -> Open File or Project... -> helloworld-pro-sailfish/harbour-helloworld-pro-sailfish.pro Qt Creator might tell you "Project ERROR: Unknown module(s) in QT: qmltest" if you don't have qmltest installed yet - that's okay, this module will be fetched automatically during the first build.

2. Choose platform kits: Uncheck Desktop, tick MerSDK-SailfishOS-i486-x86 (for the emulator) and/or arm (for the real phone) options.

3. Configure build type (toolbar icon "harbour-helloworld-pro-sailfish Debug"): "i486-x86" & "Debug" & "Deploy as RPM package" & "src (on Mer device)"

4. Start Sdk and Emulator (bottom-left toolbar buttons)

5. Build, install and run the project (play button in the toolbar)

6. You should see the silly primitive calculator app installed and running in the emulator.

### Running tests
* Option 1: In the emulator console, just run `/usr/share/tst-harbour-helloworld-pro-sailfish/runTestsOnDevice.sh` Here are instructions on connecting to the emulator's console - https://sailfishos.org/develop-faq.html

* Option 2: Inside SailfishOS IDE

 1. Toolbar -> Projects -> i486 -> Run -> Run Settings -> Run -> Run configuration -> "src (on Mer Device)" -> "Use this command instead"

 2. Set "Alternate executable on device:" to `/usr/share/tst-harbour-helloworld-pro-sailfish/runTestsOnDevice.sh`

 3. Run the project again, see test results in the console

For more info on testing QML, you may like to start at http://www.slideshare.net/AgileArtem/test-drivingqml-12941898

### Building for a real device and Jolla Harbour submissiong
1. Switch kit in project build configuration to MerSDK-SailfishOS-armv7-hl.
2. Check whether QtCreator overwrote the .yaml file. Sometimes it corrupts it on target switch. Restore .yaml from version control if this happens.
3. Clean project. Otherwise Creator will happily package the old i486 binaries
4. Build project
5. Deploy project (in the Creator's Build menu)
6. Final binaries will be located in RPMS folder and will look like `harbour-helloworld-pro-sailfish-0.1-1.armv7hl.rpm` Submit this RPM to harbour

Build and installation (command line version)
-----------------------

The following assumes that you have installed the SailfishOS SDK into your home directory under the name SailfishOS, and that you want to build an RPM package that you can install on the Jolla phone.

1. Connect to the virtual machine of the Sailfish SDK build engine:

 ssh -p 2222 -i ~/SailfishOS/vmshare/ssh/private_keys/engine/mersdk mersdk@localhost

2. Change to the same directory where you have your git clone:

 cd git/helloworld-pro-sailfish

3. Prepare the build:

 mb2 -t SailfishOS-armv7hl qmake

4. Execute the build (producing packages in the RPMS directory):

 mb2 -t SailfishOS-armv7hl rpm

5. Exit the virtual machine and then copy the package to the phone:

 scp -i ~/SailfishOS/vmshare/ssh/private_keys/SailfishOS_Device/nemo RPMS/harbour-helloworld-pro-sailfish-0.4-4.armv7hl.rpm nemo@ip.address.of.phone:RPMS/

6. Connect to the phone and install the package:

 ssh -i ~/SailfishOS/vmshare/ssh/private_keys/SailfishOS_Device/nemo nemo@ip.address.of.phone pkcon install-local RPMS/harbour-helloworld-pro-sailfish-0.4-4.armv7hl.rpm

Random notes about the project:
=========

1. Project structure
    * We follow traditional Qt project structure with main project having two subprojects: src and tests
    * .yaml file (and .spec generated from .yaml) defines two subpackages:
        * harbour-helloworld-pro-sailfish - contains just the app files. It is something you will submit to app store
        * harbour-helloworld-pro-sailfish-tests - contains just the test binary and test files. For development only
    * .gitignore in the current project is supposed to be useful too, we try to check in only what's really needed without any local environment details
2. Code structure
    * Note how tst_....qml files import the main project files. When running in device you want to import from final QML location that in this case is `../harbour-helloworld-pro-sailfish/qml/pages` relative from the test project deployment folder. When editing test file on desktop QtCreator sure has no idea where the main files are located, so during desktop editing I uncomment `import ../src/qml/pages` line to make QtCreator code completion work.
3. Further links
    * There are more comments in the tests code and .pro and .yaml files too
    * QtQuickTest reference - https://qt-project.org/doc/qt-5.1/qtdoc/qtquick-qtquicktest.html
    * Few still relevant hints about test-driving QML projects can be found in Artem's old presentation at http://www.slideshare.net/AgileArtem/test-driving-qml
    * The Jolla official icon templates for creating app icons with Sailfish look can be found at https://sailfishos.org/apps_icons.html

ToDo
=========
That is supposed to be a public easy to use getting started real good app template in the public domain. The vision is that we want to be so good, it would make sense to make this project a default Sailfish app template (maybe not the simlest app template, but "good real app template").

All the pull requests are very welcome. I can see the following ToDo things for now (in the order of priority I think):
* Create renaming wizard for Windows. Or do a cross-platform Python script or something like this
* improve rename-to-my-project.sh. A bit too much duplication there
* Improve docs. Always a noble goal
* Make an app Cover page with one-two actions
    * And demonstrate a good way to share data between pages and cover (store it in main.qml possibly)
* Add some QML part that is runnable on desktop, create test for it and show how to test it on desktop. That is to illustrate how you could develop part of the app on desktop only (for faster development cycle)
* Add (or at least consider) adding C++ side too: a custom C++ side object importable to QML with C++ side qtest for it
* Better app icon. Current one is good, but can always be improved to communicate exactly the HelloWorld copy-pastable state

Saying thank you
-------------
* The best way to say thank you is to improve it with pull request.
* You can also consider installing it from harbour (not published as of Nov 30 2013 yet, but should be published soon) and rating it high in the app store - will help to contribute
* Following the original author on Twitter - http://twitter.com/AgileArtem will warm up his heart too :)

Support and license
-------------------

License (or rather Unlicence) is public domain. Do with the code whatever you like including reselling it as long as you don't keep the authors responsible for anything. It's nice if you mention this project as your starting point somewhere in your code or About dialog, but it is not required by any means.

Pull requests are very welcome. Github issues are the preferred way for defect management and improvement.

A faster way to get support can also be to ask at #sailfishos channel at Freenode IRC (particularly user artemma might be able to help)

Have fun! :)
