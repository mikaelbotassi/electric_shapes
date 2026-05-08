import 'package:electric_shapes/src/shapes/electric_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAssetShape extends ElectricShape {
  const SvgAssetShape({
    required this.assetPath,
    required this.aspectRatio,
    required super.size,
    required super.color,
    required super.strokeWidth,
    super.key,
  });

  final String assetPath;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: rootBundle.loadString('packages/electric_shapes/$assetPath'),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(width: size * aspectRatio, height: size);
        }

        final resolvedStrokeWidth = strokeWidth <= 1 ? 4.5 : strokeWidth;
        final dotRadius = resolvedStrokeWidth * 0.95;
        final svg = snapshot.data!
            .replaceAll('{{stroke_width}}', resolvedStrokeWidth.toString())
            .replaceAll('{{dot_radius}}', dotRadius.toString());

        return SizedBox(
          width: size * aspectRatio,
          height: size,
          child: SvgPicture.string(
            svg,
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        );
      },
    );
  }

  @override
  ElectricShape copyWith({double? size, Color? color, double? strokeWidth}) {
    return SvgAssetShape(
      assetPath: assetPath,
      aspectRatio: aspectRatio,
      size: size ?? this.size,
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
    );
  }
}
