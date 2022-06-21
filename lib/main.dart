import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';

import 'app_state.dart';
import 'router/back_dispatcher.dart';
import 'router/router_delegate.dart';
import 'router/shopping_parser.dart';
import 'router/ui_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appState = AppState();
  ShoppingRouterDelegate? delegate;
  final parser = ShoppingParser();
  ShoppingBackButtonDispatcher? backButtonDispatcher;

  StreamSubscription? _linkSubscription;

  _MyAppState() {
    delegate = ShoppingRouterDelegate(appState);
    delegate!.setNewRoutePath(SplashPageConfig);
    backButtonDispatcher = ShoppingBackButtonDispatcher(delegate!);
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  void dispose() {
    if (_linkSubscription != null) _linkSubscription!.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Attach a listener to the Uri links stream
    _linkSubscription = getUriLinksStream().listen((Uri? uri) {
      if (!mounted) return;
      setState(() {
        delegate!.parseRoute(uri!);
      });
    }, onError: (Object err) {
      print('Got error $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => appState,
      child: MaterialApp.router(
        title: 'Navigation App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          brightness: Brightness.dark,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        backButtonDispatcher: backButtonDispatcher,
        routerDelegate: delegate!,
        routeInformationParser: parser,
      ),
    );
  }
}
