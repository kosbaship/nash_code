import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nash_code/ui/home_screen.dart';
import 'package:nash_code/ui/register_screen.dart';
import 'package:nash_code/ui/shared/app_color.dart';
import 'package:nash_code/ui/shared/helper_methods.dart';

import 'logic/cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: kDefaultColor,
        // primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => HomeCubit(),
        child: SignUpScreen(),
        //HomeScreen(),
      ),
    );
  }
}
