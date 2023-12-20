import 'package:flutter/material.dart';

class CircleLogo extends StatelessWidget {
  final String brandImageUrl;
  const CircleLogo({super.key, required this.brandImageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        25,
      ),
      child: Image.network(
        brandImageUrl,
        fit: BoxFit.fill,
        errorBuilder: (context, error, stackTrace) => Image.network(
            "https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fbrands%2F1702834720203image_picker_D2A78E9A-EC1F-438C-83C6-AD5011B25C73-7089-00000892F07CC209.png?alt=media&token=5e5c9cc5-e896-4dc9-bed8-56126195f112"),
      ),
    );
  }
}
