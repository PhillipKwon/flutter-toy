import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toy/screen/home_screen.dart';
import 'package:flutter_toy/screen/more_screen.dart';
import 'package:flutter_toy/screen/search_screen.dart';
import 'package:flutter_toy/widget/bottom_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kwonflix",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.black,
          highlightColor: Colors.white),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeSceen(),
              SearchScreen(),
              Container(child: Center(child: Text("save"))),
              MoreScreen(),
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
