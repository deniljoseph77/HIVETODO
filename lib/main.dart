import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist1/presentation/home_screen/view/HomeScreen.dart';


 void main() async {
  //initalize hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox("mybox");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

