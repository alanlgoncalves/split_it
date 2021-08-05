import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:split_it/modules/create_split/create_split_page.dart';
import 'package:split_it/modules/error/error_page.dart';
import 'package:split_it/modules/home/home_page.dart';
import 'package:split_it/modules/login/login_page.dart';
import 'package:split_it/modules/splash/splash_page.dart';
import 'package:split_it/shared/utils/routes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Split.it",
      builder: BotToastInit(), //1. call BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: Routes.splash.route,
      routes: {
        Routes.splash.route: (context) => SplashPage(),
        Routes.login.route: (context) => LoginPage(),
        Routes.error.route: (context) => ErrorPage(),
        Routes.home.route: (context) => HomePage(),
        Routes.create_split.route: (context) => CreateSplitPage(),
      },
    );
  }
}
