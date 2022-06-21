import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

const String LoggedInKey = 'LoggedIn';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _initialized = false;
  AppState? appState;

  @override
  Widget build(BuildContext context) {
    appState = Provider.of<AppState>(context);
    final query = MediaQuery.of(context);
    final size = query.size;
    final itemWidth = size.width;
    final itemHeight = itemWidth * (size.width / size.height);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(Icons.flutter_dash, size: 100,),
            SizedBox(height: 16,),
            Text('Flutter routing POC')
          ],
        ),
      ),
    );
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _initialized = true;
      Timer(const Duration(milliseconds: 2000), () {
        appState!.setSplashFinished();
      });
    }
  }
}
