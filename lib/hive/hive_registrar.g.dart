// Generated by Hive CE
// Do not modify
// Check in to version control

import 'package:hive_ce/hive.dart';
import 'package:hive_database_demo/hive/hive_adapters.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(CategoriesAdapter());
    registerAdapter(ProductAdapter());
  }
}