import 'package:flutter/material.dart';
import 'package:flutter_application_2/cubit/my_cubit.dart';
import 'package:flutter_application_2/home_screen.dart';
import 'package:flutter_application_2/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => getIt<MyCubit>(),
        child: HomeScreen(),
      ),
    );
  }
}
