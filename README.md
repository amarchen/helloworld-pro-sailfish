Sailfish app with QML test
=========

A minimal project for demonstrating the project structure with a simple app and a couple of QML tests that verify stuff in both UI level and under UI level. In the bright future it might be the ideal super-polished good app template with all the minimal stuff you need in real app, but nothing else.

Quick-start your own app
------------
If you know all the basics and just want a quick start for your app
Run `./rename-to-my-project.sh harbour-mycoolapp`
That certainly won't work for Windows without cygwin or similar. If you create a similar batch file for windows or create a platform-independ script (e.g. in Python), please, submit one via pull request

Installation aka Getting Started
------------

These instructions are emulator development specific as that's the only device I have :)
Instructions should work for the hardware device too though

### Running app
1. git clone or download sources. Import to Qt Creator. If you developed for emulator, you need to agree to configure project for MerSDK-SailfishOS-i486-x86 kit.

2. Open Projects tab, select i486 target, then Run tab. Choose Deploy as RPM Package for the deployment methos

3. Run i486 src subproject in emulator from QtCreator Run button in the left side bar (just make sure i486->src is selected)
This will run build and deploy everything and you should see the silly priomitive calculator app running

### Running tests
* In the emulator console

Just run `/usr/share/tst-harbour-helloworld-pro-sailfish/runTestsOnDevice.sh`

* Inside Qt Creator

1. In the project configuration, for src project (not for tests one!) click "Use this command instead"

2. set "Alternate executable on device:" to `/usr/share/tst-harbour-helloworld-pro-sailfish/runTestsOnDevice.sh`

3. Run the project, see test results in the console

Voila, Run button inside QtCreator will run tests for you now. For more info on testing QML, you may like to start at http://www.slideshare.net/AgileArtem/test-drivingqml-12941898

Building for a real device and Jolla Harbour submissiong
------------
1. Switch to MerSDK-SailfishOS-armv7-hl kit.
2. Check if QtCreator overwritten .yaml file. Sometimes it corrupts it on target switch. Restore .yaml from version control if it happened
3. Clean project. Otherwise Creator will happily package the old i486 binaries
4. Build project
5. Deploy project (in the Creator's Build menu)
6. Final binaries will be located in RPMS folder and will look like `harbour-helloworld-pro-sailfish-0.1-1.armv7hl.rpm` Submit this RPM to harbour

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