import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_demo/network/network.dart';
import 'package:sample_demo/screen/home_page.dart';
import 'package:sample_demo/utils/change_theme.dart';

void main() => runApp(const MyApp());

/// This is the main class where we are calling first screen
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: MultiProvider(
        providers: [
          Provider<Network>(create: (_) => Network()),
          ChangeNotifierProvider<AppStyleModeNotifier>(create: (context) {
            return AppStyleModeNotifier();
          })
        ],
        child: const HomePage(),
      ),
    );
  }
}
