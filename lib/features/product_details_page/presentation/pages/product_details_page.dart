import 'package:flutter/material.dart';
import 'package:slash_internship_assignment/features/product_details_page/data/data_source/data_sources.dart';
import 'package:slash_internship_assignment/features/product_details_page/data/model/get_product_variations.dart';
import 'package:simple_selector/simple_selector.dart';
import 'package:slash_internship_assignment/features/product_details_page/domain/services/services.dart';
import 'package:slash_internship_assignment/features/products_page/presentation/widgets/rec_image.dart';
import '../../../../core/theme/app_color_theme.dart';
import 'package:carousel_animations/carousel_animations.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../products_page/presentation/widgets/circle_logo.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productId;
  const ProductDetailsPage({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool loadings = false;
  late GetProductVariations productVariations;
  late Services _services;

  Future<GetProductVariations> getProducts() async {
    setState(() {
      loadings = true;
    });

    productVariations = await GetProductVariationsRemoteDataSourceImpl()
        .getProductVariations(widget.productId);

    setState(() {
      _services = Services(productVariations: productVariations);
      imageCount = _services.getInitialImageCount();
      variationId = _services.getDefaultId();
      if (_services.availablePropertiesList().isNotEmpty) {
        for (int i = 0; i < _services.availablePropertiesList().length; i++) {
          selectedProp[
                  '${_services.getProductVariationsData().variations![0].productPropertiesValues![i].property}'] =
              '${_services.getProductVariationsData().variations![0].productPropertiesValues![i].value}';
        }
      }

      loadings = false;
    });
    return productVariations;
  }

  int? imageIndex = 0;

  int selectedColor = 0;
  int selectedSize = 0;
  int selectedMaterial = 0;
  int selectedImage = 0;
  SwiperController swiperController = SwiperController();
  Map<String, String> selectedProp = {};
  int variationId = 0;
  int imageCount = 0;
  bool inStock = true;
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
        title: const Text('Product details.'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: AppColorTheme.primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: loadings
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(.0),
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          imageIndex = index;
                        });
                      },
                      controller: swiperController,
                      indicatorLayout: PageIndicatorLayout.WARM,
                      layout: SwiperLayout.CUSTOM,
                      itemCount: imageCount,
                      customLayoutOption:
                          CustomLayoutOption(startIndex: -1, stateCount: 3)
                            ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                            ..addTranslate([
                              const Offset(-300.0, -40.0),
                              const Offset(0.0, 0.0),
                              const Offset(300.0, -40.0)
                            ]),
                      itemWidth: MediaQuery.sizeOf(context).width / 1.5,
                      itemHeight: 300.0,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(-5, 5),
                              )
                            ],
                          ),
                          child: RecImage(
                              imageUrl: _services
                                  .getImagesByVId(variationId)[index]
                                  .imagePath!),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SimpleSelector(
                    selectedIndex: imageIndex!,
                    dense: false,
                    items: List.generate(
                      imageCount,
                      (innerIndex) {
                        return Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(-5, 5),
                              )
                            ],
                            borderRadius: BorderRadius.circular(6),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(_services
                                    .getImagesByVId(variationId)[innerIndex]
                                    .imagePath!)),
                          ),
                        );
                      },
                    ),
                    backgroundColor: AppColorTheme.backGround,
                    indicatorColor: const Color.fromARGB(255, 193, 235, 86),
                    itemExtent: 55,
                    height: 55,
                    radius: 10,
                    onChanged: (innerIndex) {
                      setState(() {
                        imageIndex = innerIndex;
                        swiperController.move(imageIndex!);
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          productVariations.data!.name!,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextTheme.black17Bold,
                        ),
                      ),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleLogo(
                          brandImageUrl: productVariations.data!.brandName!,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${productVariations.data!.variations![selectedColor].price}',
                        style: AppTextTheme.black14Bold,
                      ),
                      const Spacer(),
                      Text(
                        '${productVariations.data!.brandName}',
                        style: AppTextTheme.black14Bold,
                      ),
                    ],
                  ),
                  _services.getAvailableColorsSet().isNotEmpty
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            SimpleSelector(
                              selectedIndex: selectedColor,
                              dense: false,
                              items: List.generate(
                                _services.getAvailableColorsSet().length,
                                (innerIndex) {
                                  String color =
                                      '0xff${_services.getAvailableColorsSet().elementAt(innerIndex)}';
                                  String newColor = color.replaceAll('#', '0');
                                  return Container(
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(
                                        int.parse(newColor),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              backgroundColor: AppColorTheme.backGround,
                              indicatorColor:
                                  const Color.fromARGB(255, 193, 235, 86),
                              itemExtent: 40,
                              height: 40,
                              radius: 20,
                              onChanged: (innerIndex) {
                                setState(() {
                                  selectedColor = innerIndex;
                                  selectedProp['Color'] = _services
                                      .getAvailableColorsSet()
                                      .elementAt(innerIndex);
                                  int id = _services.checkInStock(selectedProp);
                                  if (id != -1) {
                                    inStock = true;

                                    variationId = id;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      : const SizedBox(
                          height: 10,
                        ),
                  _services.getAvailableSizesSet().isNotEmpty
                      ? Column(
                          children: [
                            const Text(
                              'Select Size',
                              style: AppTextTheme.black14Bold,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SimpleSelector(
                              selectedIndex: selectedSize,
                              dense: false,
                              items: List.generate(
                                _services.getAvailableSizesSet().length,
                                (innerIndex) {
                                  return Text(
                                    _services
                                        .getAvailableSizesSet()
                                        .elementAt(innerIndex),
                                    style: AppTextTheme.black14Bold,
                                  );
                                },
                              ),
                              backgroundColor: AppColorTheme.backGround,
                              indicatorColor:
                                  const Color.fromARGB(255, 193, 235, 86),
                              itemExtent: 80,
                              height: 40,
                              radius: 20,
                              onChanged: (innerIndex) {
                                setState(() {
                                  selectedProp['Size'] = _services
                                      .getAvailableSizesSet()
                                      .elementAt(innerIndex);
                                  int id = _services.checkInStock(selectedProp);
                                  if (id != -1) {
                                    inStock = true;
                                    selectedSize = innerIndex;

                                    variationId = id;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      : const SizedBox(
                          height: 10,
                        ),
                  _services.getAvailableMaterialsSet().isNotEmpty
                      ? Column(
                          children: [
                            const Text(
                              'Select Material',
                              style: AppTextTheme.black14Bold,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SimpleSelector(
                              selectedIndex: selectedMaterial,
                              dense: false,
                              items: List.generate(
                                _services.getAvailableMaterialsSet().length,
                                (innerIndex) {
                                  return Text(
                                    _services
                                        .getAvailableMaterialsSet()
                                        .elementAt(innerIndex),
                                    style: AppTextTheme.black14Bold,
                                  );
                                },
                              ),
                              backgroundColor: AppColorTheme.backGround,
                              indicatorColor:
                                  const Color.fromARGB(255, 193, 235, 86),
                              itemExtent: 80,
                              height: 40,
                              radius: 20,
                              onChanged: (innerIndex) {
                                setState(() {
                                  selectedProp['Materials'] = _services
                                      .getAvailableMaterialsSet()
                                      .elementAt(innerIndex);
                                  int id = _services.checkInStock(selectedProp);
                                  if (id != -1) {
                                    inStock = true;

                                    variationId = id;
                                    selectedMaterial = innerIndex;
                                  }
                                });
                              },
                            ),
                          ],
                        )
                      : const SizedBox(
                          height: 10,
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  ExpansionTile(
                    title: const Text('Description'),
                    backgroundColor: Colors.grey[900],
                    collapsedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('${productVariations.data!.description}'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      inStock ? 'Add to cart' : 'Out of Stock',
                      style: AppTextTheme.black17Bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
    );
  }
}
