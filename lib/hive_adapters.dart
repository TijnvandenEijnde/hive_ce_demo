import 'package:hive_ce/hive.dart';
import 'product.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<Product>()])
@GenerateAdapters([AdapterSpec<Categories>()])

class HiveAdapters {}