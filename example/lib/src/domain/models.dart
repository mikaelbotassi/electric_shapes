import 'package:flutter/cupertino.dart';

typedef ShapeBuilder = Widget Function({
  required double size,
  required Color color,
  required double strokeWidth,
});

class ShapeSection {
  const ShapeSection({
    required this.title,
    required this.items,
  });

  final String title;
  final List<ShapeSpec> items;
}

class ShapeSpec {
  const ShapeSpec({
    required this.builder,
  });

  final ShapeBuilder builder;
}

class IconSpec {
  const IconSpec(this.label, this.icon);

  final String label;
  final IconData icon;
}