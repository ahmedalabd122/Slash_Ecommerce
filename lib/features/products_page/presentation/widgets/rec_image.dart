import 'package:flutter/material.dart';

class RecImage extends StatelessWidget {
  final String imageUrl;

  const RecImage({super.key, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.sizeOf(context).width - 50) / 2,
      height: (MediaQuery.sizeOf(context).width - 80) / 2,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SizedBox.fromSize(
          size: const Size.fromRadius(100),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Image.network(
                'https://firebasestorage.googleapis.com/v0/b/slash-f711b.appspot.com/o/images%2Fproduct-variants%2F1702842151610image_picker_2D257B4C-6500-4BB9-ADAD-BA7594B78586-7089-000008B2B1A54B9E.jpg?alt=media&token=4cad311e-9cbe-4191-95aa-e61b651bcbdc'),
          ),
        ),
      ),
    );
  }
}
