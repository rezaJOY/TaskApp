import 'package:flutter/material.dart';
import 'package:task_app/auth/login.dart';
import 'package:task_app/auth/register.dart';
import 'package:task_app/screen/task_screen.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue   //Color swatch is used when we want app to be dark type
        ),
         //home: Login(),
     home: TaskScreen(),
    );
  }
}
