import 'package:flutter/material.dart';
import 'package:slash_internship_assignment/core/theme/app_text_theme.dart';
import 'package:slash_internship_assignment/features/products_page/data/model/product_model.dart';
import 'package:slash_internship_assignment/features/products_page/presentation/widgets/circle_logo.dart';
import 'package:slash_internship_assignment/features/products_page/presentation/widgets/rec_image.dart';

import '../../../../core/theme/app_color_theme.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Color favColor = Colors.grey;
  Color cartColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColorTheme.backGround,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                '/productDetailsPage',
                arguments: widget.product.id,
              );
            },
            child: RecImage(
              imageUrl: widget.product.productVariations!.first
                  .productVarientImages!.first.imagePath!,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.product.name!,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextTheme.black17Bold,
                ),
              ),
              SizedBox(
                width: 40,
                height: 40,
                child: CircleLogo(
                  brandImageUrl: widget.product.brands!.brandLogoImagePath!,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.product.productVariations!.first.price!.toString()} EGP',
                style: AppTextTheme.black14Bold,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (favColor == Colors.grey) {
                      favColor = Colors.red;
                    } else if (favColor == Colors.red) {
                      favColor = Colors.grey;
                    }
                  });
                },
                child: Icon(
                  Icons.favorite,
                  color: favColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    if (cartColor == Colors.grey) {
                      cartColor = Colors.green;
                    } else if (cartColor == Colors.green) {
                      cartColor = Colors.grey;
                    }
                  });
                },
                child: Icon(
                  Icons.shopping_cart,
                  color: cartColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
