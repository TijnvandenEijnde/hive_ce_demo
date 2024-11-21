import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hive_database_demo/hive_boxes.dart';
import 'package:hive_database_demo/product.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    required this.products,
    super.key,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<Product>>(
      valueListenable: Hive.box<Product>(productBox).listenable(),
      builder: (BuildContext context, Box<Product> box, Widget? _) =>
          ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          final product = Product.fromJson(products[index].toJson());
          final isReceived = box.values
                  .where((Product existing) => existing.id == product.id)
                  .firstOrNull != null;

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(product.category.name),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('(${product.stock}) \$${product.price.toString()}'),
                      TextButton(
                        onPressed:
                            isReceived ? null : () async => box.add(product),
                        child: isReceived
                            ? const Text('Received')
                            : const Text('Add'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
