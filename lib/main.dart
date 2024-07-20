import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:web_and_craft/services/api_service.dart';
import 'package:web_and_craft/utils/theme.dart';
import 'package:web_and_craft/view%20model/home_viewmodel.dart';
import 'package:web_and_craft/view/view/homescreen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(ApiService()),
        ),
      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          title: 'Machine Test',
          theme: lightTheme,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
