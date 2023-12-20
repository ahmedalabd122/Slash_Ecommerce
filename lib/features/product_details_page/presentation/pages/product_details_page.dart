import 'package:flutter/material.dart';
import 'package:slash_internship_assignment/features/product_details_page/data/data_source/data_sources.dart';
import 'package:slash_internship_assignment/features/product_details_page/data/model/get_product_variations.dart';
import 'package:simple_selector/simple_selector.dart';
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

  Future<GetProductVariations> getProducts() async {
    setState(() {
      loadings = true;
    });
    productVariations = await GetProductVariationsRemoteDataSourceImpl()
        .getProductVariations(widget.productId);
    setState(() {
      loadings = false;
      imageCount =
          productVariations.data!.variations![0].productVarientImages!.length;
    });
    return productVariations;
  }

  int selected = 0;
  int imageCount = 0;
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
        title: Text('Product details.'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColorTheme.primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
      ),
      body: loadings
          ? Center(child: CircularProgressIndicator.adaptive())
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(.0),
                    child: Swiper(
                      indicatorLayout: PageIndicatorLayout.WARM,
                      layout: SwiperLayout.CUSTOM,
                      itemCount: imageCount,
                      customLayoutOption:
                          CustomLayoutOption(startIndex: -1, stateCount: 3)
                            ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
                            ..addTranslate([
                              Offset(-300.0, -40.0),
                              Offset(0.0, 0.0),
                              Offset(300.0, -40.0)
                            ]),
                      itemWidth: MediaQuery.sizeOf(context).width / 1.5,
                      itemHeight: 300.0,
                      itemBuilder: (context, index) {
                        return RecImage(
                            imageUrl: productVariations
                                .data!
                                .variations![selected]
                                .productVarientImages![index]
                                .imagePath!);
                      },
                    ),
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
                        '${productVariations.data!.variations![selected].price}',
                        style: AppTextTheme.black14Bold,
                      ),
                      const Spacer(),
                      Text(
                        '${productVariations.data!.brandName}',
                        style: AppTextTheme.black14Bold,
                      ),
                    ],
                  ),
                  Container(
                    height: productVariations.data!.avaiableProperties!.length *
                        110,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount:
                          productVariations.data!.avaiableProperties!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                '${productVariations.data!.avaiableProperties?[index].property}'),
                            const SizedBox(
                              height: 10,
                            ),
                            SimpleSelector(
                              selectedIndex: selected,
                              dense: false,
                              items: List.generate(
                                  productVariations
                                      .data!
                                      .avaiableProperties![index]
                                      .values!
                                      .length, (innerIndex) {
                                if (productVariations.data!
                                        .avaiableProperties?[index].property ==
                                    'Color') {
                                  String color =
                                      '0xff${productVariations.data!.avaiableProperties?[index].values![innerIndex].value}';
                                  String newColor = color.replaceAll('#', '0');
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(
                                        int.parse(newColor),
                                      ),
                                    ),
                                  );
                                }

                                return Text(
                                    '${productVariations.data!.avaiableProperties?[index].values![innerIndex].value}');
                              }),
                              indicatorColor: selected == 0
                                  ? const Color(0xff2980b9)
                                  : const Color(0xff2980b9).withOpacity(0.5),
                              itemExtent: 60,
                              height: 60,
                              onChanged: (innerIndex) {
                                print(
                                    '${productVariations.data!.avaiableProperties?[index].values![innerIndex].id}');
                                setState(() {
                                  selected = innerIndex;
                                  imageCount = productVariations
                                      .data!
                                      .variations![innerIndex]
                                      .productVarientImages!
                                      .length;
                                });
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  ExpansionTile(
                    title: const Text('Description'),
                    children: [Text('${productVariations.data!.description}')],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      'Add to cart',
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
