import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/provider/homeProvider.dart';
import 'screen/view/homeScreen.dart';
import 'screen/view/nextScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => HomeScreen(),
          'next' : (context) => NextScreen(),
        },
      ),
    ),
  );
}