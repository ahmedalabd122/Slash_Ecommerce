import 'package:flutter/material.dart';
import 'package:slash_internship_assignment/features/products_page/data/data_source/data_sources.dart';
import 'package:slash_internship_assignment/features/products_page/data/model/get_products_model.dart';
import 'package:slash_internship_assignment/features/products_page/presentation/widgets/product_grid.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool loadings = false;
  late GetProductsModel productsModel;

  Future<GetProductsModel> getProducts() async {
    setState(() {
      loadings = true;
    });
    productsModel = await GetProductsRemoteDataSourceImpl().getProducts();
    setState(() {
      loadings = false;
    });
    return productsModel;
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Slash.'),
        elevation: 0,
      ),
      body: loadings
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : ProductsGrid(
              productModel: productsModel,
            ),
    );
  }
}
