import 'package:flutter/material.dart';
import 'package:movies_app/Core/theme/my_theme.dart';
import 'package:movies_app/View/home_screen.dart';

import 'View/home/details/details_view.dart';
import 'View/splash_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.darkTheme,
      darkTheme: MyTheme.darkTheme,
      initialRoute: SplashView.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SplashView.routeName: (_) => SplashView(),
        DetailsView.routeName: (_) => DetailsView(),
      },
    );
  }
}
