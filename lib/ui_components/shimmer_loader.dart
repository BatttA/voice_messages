import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoaderWidget extends StatelessWidget {
  final double width;
  final double height;
  final List<Color> shimmerColors;

  const ShimmerLoaderWidget({
    Key? key,
    this.width = 100,
    this.height = 20,
    this.shimmerColors = const [
      Colors.black26,
      Colors.black12,
      Colors.white10,
    ],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: shimmerColors,
      ),
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
        ),
      ),
    );
  }
}

class TextShimmerLoaderWidget extends StatelessWidget {
  final List<Color> shimmerColors;
  final String text;

  const TextShimmerLoaderWidget({
    Key? key,
    this.shimmerColors = const [
      Colors.black,
      Colors.black54,
      Colors.black26,
    ],
    this.text = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      gradient: LinearGradient(
        colors: shimmerColors,
      ),
      child: Text(text),
    );
  }
}
