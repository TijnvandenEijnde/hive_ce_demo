import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hive_database_demo/hive_types.dart';

part 'product.g.dart';

@HiveType(typeId: productCategoryTypeId)
enum Categories {
  @HiveField(0)
  beauty,
  @HiveField(1)
  fragrances
}

@HiveType(typeId: productTypeId)
class Product extends HiveObject {
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.stock,
  });

  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final Categories category;

  @HiveField(4)
  int stock;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'],
    title: json['title'],
    price: json['price'],
    category: Categories.values.byName(json['category']),
    stock: json['stock'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'price': price,
    'category': category.name,
    'stock': stock,
  };
}
