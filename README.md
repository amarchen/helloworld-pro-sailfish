Sailfish app with QML test
=========

A minimal project for demonstrating the project structure with a simple app and a couple of QML tests that verify stuff in both UI level and under UI level. In the bright future it might be the ideal super-polished good app template with all the minimal stuff you need in real app, but nothing else.

Installation aka Getting Started
------------

These instructions are emulator development specific as that's the only device I have :)
Instructions should work for the hardware device too though

### Running something
1. git clone or download sources. Import to Qt Creator. If you developed for emulator, you need to agree to configure project for MerSDK-SailfishOS-i486-x86 kit.

2. Open Projects tab, select i486 target, then Run tab. Choose Deploy as RPM Package for the deployment methos
You'll need to deploy it this way at least once so that dependencies (e.g. QtQuickTest get installed)

3. Run i486 src subproject in emulator from QtCreator Run button in the left side bar (just make sure i486->src is selected)
This will run build and deploy everything and you should see the silly priomitive calculator app running

### Running tests
* In the emulator console

_If you just installed Alpha-Qt5 SDK and RPM deployment fails somewhere on the way, ssh to emulator as described below and run `zypper refresh` there. I it a known issue with package databases being somehow wrong in the initial emulator_

Simplest way is to start console on emulator as is described at https://sailfishos.org/develop-faq.html
At Alpha-Qt5 SDK time that used to be `ssh -p 2223 nemo@localhost` with password nemo

Then run `/usr/bin/tst-sailfish-app-with-qml-test -input /usr/share/tst-sailfish-app-with-qml-test/`
7 tests should pass

* Inside Qt Creator
You can run tests from Qt Creator tests project configuration, but at the moment QtC fails to parse project files properly.

*Sometimes* Qt Creator lets you specify "Alternate executable on device " fir the tests run configutation, but I fail to understand when it is possible. Most of the time it seems to be impossible.

During daily development you can run the tests inside QtCreator the following way:

1. Change the deployment method to "Deploy by copying binaries". It will not install dependencies for you, but if you deployed via RPM at least once, dependencies should already be inside the device

2. Specify "Alternative executable on the device" as `/usr/bin/tst-sailfish-app-with-qml-test`, check "Use this command instead" and set Arguments as `-input /usr/share/tst-sailfish-app-with-qml-test/`

Voila, Run button inside QtCreator should run tests for you now


Contents/Guide
------------

Random notes about the project structure:

1. Project structure
* We follow traditional Qt project structure with main project having two subprojects: src and tests
* .spec file defines two subpackages:
   * sailfish-app-with-qml-test - contains just the app files. It is something you will submit to app store
   * sailfish-app-with-qml-test-tests - contains just the test binary and test files. For development only
* There is no .yaml file. In the current SDK it seems to be impossible to use .yaml with the multiple packages. I failed to figure out a way to make it work. You should be fine with just .spec though
* .gitignore in the current project is supposed to be useful too, we try to check in only what's really needed without any local environment details

2. Code structure
* Note how tst_....qml files import the main project files. When running in device you want to import from final QML location that in this case is `../sailfish-app-with-qml-test/pages` relative from the test project deployment folder. When editing test file on desktop QtCreator sure has no idea where the main files are located, so during desktop editing I uncomment `import ../src/pages` line to make QtCreator code completion work.

3. Further links
* There are more comments in the tests code and .pro and .spec files too
* QtQuickTest reference - https://qt-project.org/doc/qt-5.1/qtdoc/qtquick-qtquicktest.html
* Few still relevant hints about test-driving QML projects can be found in Artem's old presentation at http://www.slideshare.net/AgileArtem/test-driving-qml


ToDo
------------
That is supposed to be a public easy to use getting started real good app template in the public domain. The vision is that we want to be so good, it would make sense to make this project a default Sailfish app template (maybe not the simlest app template, but "good real app template").

All the pull requests are very welcome. I can see the following ToDo things for now (in the order of priority I think):
* Add app icon a'la https://github.com/amarchen/Wikipedia is doing
* Figure out how to make tests configuration work with RPM deployment
* Try shadow build config to get rid of object files and final binaries and final packages generated inside the project right now
* Improve docs
* Invent a better project name (and rename all the stuff). It is a bit confusing when app name includes "test" in its name and has "tests" subproject inside
* Why is sailfish-app-with-qml-test binary generated in two places (main folder and src folder)?
* Add (or at least consider) adding C++ side too: a custom C++ side object importable to QML with C++ side qtest for it
* Add some QML part that is runnable on desktop, create test for it and show how to test it on desktop. That is to illustrate how you could develop part of the app on desktop only (for faster development cycle)


Support and license
-------------------

License (or rather Unlicence) is public domain. Do with the code whatever you like including reselling it as long as you don't keep the authors responsible for anything. It's nice if you mention this project as your starting point somewhere in your code or About dialog, but it is not required by any means.

Pull requests are very welcome. Github issues are the preferred way for defect management and improvement.

A faster way to get support can also be to ask at #sailfishos channel at Freenode IRC (particularly user artemma might be able to help)

Have fun! :)