import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    super.key,
    this.image,
    this.height,
    this.width,
    this.fit,
  });

  final String? image;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: fit ?? BoxFit.cover,
          image: NetworkImage(
            image ?? "https://picsum.photos/200/300",
          ),
        ),
      ),
    );
  }
}
