import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/network/service.dart';
import 'package:sample_demo/screen/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Provider<Service>(
          create: (BuildContext context) => Service(),
          child: const HomePage()),
    );
  }
}
