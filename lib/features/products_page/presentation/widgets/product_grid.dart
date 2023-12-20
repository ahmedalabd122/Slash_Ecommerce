import 'package:flutter/material.dart';
import 'package:slash_internship_assignment/features/products_page/data/model/get_products_model.dart';
import 'package:slash_internship_assignment/features/products_page/presentation/widgets/product_card.dart';

class ProductsGrid extends StatelessWidget {
  final GetProductsModel productModel;

  const ProductsGrid({super.key, required this.productModel});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height) / 2;
    final double itemWidth = size.width / 1.5;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: productModel.products?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 10,
              childAspectRatio: (itemWidth / itemHeight)),
          itemBuilder: ((context, index) {
            return ProductCard(
              product: productModel.products![index],
            );
          }),
        ),
      ),
    );
  }
}
