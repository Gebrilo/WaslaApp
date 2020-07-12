import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/product_item.dart';
import '../provider/products_provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final products = showFavs ? productData.favoritesItems : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(15.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
//        create: (ctx) => products[i], this other way we can do here by
//        using ChangeNotifierProvider
        value: products[i],
        child: ProductItem(
//          products[i].id,
//          products[i].title,
//          products[i].imageUrl,
//          products[i].price,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
