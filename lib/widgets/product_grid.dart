import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
import './product_item.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return Container(
      child: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 4 / 2,
          crossAxisSpacing: 100,
          mainAxisExtent: 400,
        ),
        itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
          value: products[index],
          child: ProductItem(
              // products[index].id,
              // products[index].title,
              // products[index].imageUrl,
              ),
        ),
        itemCount: products.length,
      ),
    );
  }
}
