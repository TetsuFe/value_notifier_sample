import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:value_notifier_sample/cart_notifier.dart';
import 'package:value_notifier_sample/cart_repository.dart';

import 'cart_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
        create: (_) => CartNotifier(repository: CartRepository()),
        child: CartPage(),
      ),
    );
  }
}
