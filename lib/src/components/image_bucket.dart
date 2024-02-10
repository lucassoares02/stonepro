import 'package:flutter/material.dart';

class ImageBucket extends StatelessWidget {
  const ImageBucket({super.key, this.idImage, this.height, this.urlImage, this.width});

  final String? idImage;
  final String? urlImage;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    String url = idImage != null
        ? "https://cloud.appwrite.io/v1/storage/buckets/65c551827ae1ff7092c2/files/$idImage/view?project=65c5510c7414d580b656&mode=admin"
        : urlImage!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        url,
        width: width ?? double.maxFinite,
        height: height ?? 190,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          return loadingProgress == null ? child : const CircularProgressIndicator();
        },
      ),
    );
  }
}
