import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mobile_bank/pages/initial_page.dart';
import 'package:mobile_bank/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'initial',
      routes: {
        'initial': (BuildContext context) => InitialPage(),
        'home': (BuildContext context) => HomePage(),
      },
    );
  }
}
