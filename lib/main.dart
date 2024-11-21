import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hive_database_demo/hive_boxes.dart';
import 'package:hive_database_demo/hive/hive_registrar.g.dart';
import 'package:hive_database_demo/order_page.dart';
import 'package:hive_database_demo/product.dart';

Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapters();

  await Hive.openBox<Product>(productBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const OrderPage(),
    );
  }
}
