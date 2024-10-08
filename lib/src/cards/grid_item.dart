import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  GridItem({
    super.key,
    this.onPressed,
    required this.goPage,
    required this.image,
    this.title,
    this.subtitle,
    this.imageSize = 84,
  });
  final borderRadius = BorderRadius.circular(24);
  final VoidCallback? onPressed;
  final Widget goPage;
  final String image;
  final String? title;
  final String? subtitle;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      elevation: 0,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => goPage));
          onPressed?.call();
        },
        child: Ink(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: imageSize,
                    width: imageSize,
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title ?? '',
                    style: const TextStyle(
                        fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle ?? '',
                    style: const TextStyle(fontSize: 17, color: Colors.black45),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
