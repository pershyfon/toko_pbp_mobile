import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:toko_pbp_mobile/screens/login.dart';
import 'package:toko_pbp_mobile/screens/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'TOKO PBP',
                theme: ThemeData(
                    primarySwatch: Colors.deepPurple,
                ),
                home: LoginPage(),
                routes: {
                    "/login": (BuildContext context) => const LoginPage(),
                },
            ),
        );
    }
}