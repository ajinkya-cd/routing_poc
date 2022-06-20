import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routing_poc/presentation/splash.dart';

import 'app_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appState = AppState();

  // TODO Create Delegate, Parser and Back button Dispatcher

  // TODO Add Subscription

  _MyAppState() {
    // TODO Setup Router & dispatcher
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    // TODO Dispose of Subscription
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // TODO Attach a listener to the Uri links stream
  }

  @override
  Widget build(BuildContext context) {
    // TODO Add Router
    return ChangeNotifierProvider<AppState>(
      create: (_) => appState,
      child: MaterialApp(
        title: 'Navigation App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Splash(),
      ),
    );
  }
}
