import 'package:flutter/material.dart';

//color constants
const kPlaceHolderColor = Colors.grey;
const kDeppGradientColor = Color(0xFF8490ff);
const kLightGradientColor = Color(0xFF62bcfc);

Widget placeHolder(double width, double height) => Container(
      width: width,
      height: height,
      color: kPlaceHolderColor,
    );

Widget defaultVerticalSpace = SizedBox(
  height: 24,
);

const Duration kDefaultOpacityDuration = Duration(milliseconds: 1000);

// String Constants
const String welcomeCaption = 'THIS IS ME';
const String name = 'SUSHMOY ROY';
const String welcomeDescription =
    'You will begin to realise why this exercise is called the Dickens Pattern (with reference to the ghost showing Scrooge some different futures)';
const String hireMe = 'Hire Me';
const String aboutMe = 'About Myself';
const String aboutMeDescription =
    'inappropriate behavior is often laughed off as “boys will be boys,” women face higher conduct standards especially in the workplace. That’s why it’s crucial that, as women, our behavior on the job is beyond reproach. inappropriate behavior is often laughed.';
const String githubIcon = 'assets/images/github_icon.png';
const String projectIcon = 'assets/images/project_icon.png';
const String codeIcon = 'assets/images/code_icon.png';

const String totalSolves = '1000+';
const String problemSolved = 'Problem Solves';

const String repository = '60+';
const String githubRepository = 'Github Repository';

const String projects = '10+';
const String totalProjects = 'Total Projects';

const String flutter = 'Flutter';
const String nodeJs = 'NodeJs';
const String native = 'Android';
const String ui = 'UI/UX';

const String dart = 'Dart';
const String kotlin = 'Kotlin';
const String cpp = 'C++';
const String javascript = 'Javascript';
const String java = 'Java';

const String description =
    "If you are looking at blank cassettes on the web, you may be very confused at the difference in price. You may see some for as low as \$17 each.";

const String flutterLogo = 'assets/images/flutter_logo.png';
const String androidLogo = 'assets/images/android_logo.png';
const String nodeJsLogo = 'assets/images/nodeJs_logo.png';

const String flutterDev = 'Flutter Apps';
const String nativeDev = 'Native Apps';
const String backendDev = 'Server Backend';

const String flutterDevDescription =
    'Flutter is a framework, developed by google, that can build applications across android, ios, web and desktop platform. '
    'Flutter is a powerful framework and it can build high quality applications. I am happy to announce that I can build apps for you using flutter which can '
    'run in various platform easily.';
const String nativeDevDescription =
    'Android is the most used platform right now. Android native framework is light, fast and flexible framework to build apps '
    'for android devices. I am happy to announce that I can build apps for you with help of android native framework and kotlin. Not to mention, Kotlin is powerful '
    'language that powers native android.';
const String backendDevDescription =
    'NodeJs is the most used javascript framework of all time. We can develop server-side applications using javascript with the '
    'help of NodeJs framework. NodeJs is light, fast and easy to maintain. I am happy to announce that I can build server backend for your front-end, mobile and '
    'desktop applications.';

const Widget home = Text('Home');
const Widget about = Text('About');
const Widget services = Text('Services');
const Widget blog = Text('Blog');
const Widget contact = Text('Contact');
