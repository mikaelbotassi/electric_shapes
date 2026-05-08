import 'package:electric_shapes/electric_shapes.dart';
import 'package:example/src/domain/models.dart';
import 'package:example/src/widgets/example_card.dart';
import 'package:flutter/material.dart';

class IconsTab extends StatelessWidget {
  const IconsTab({
    super.key,
    required this.icons,
    required this.size,
    required this.color,
  });

  final List<IconSpec> icons;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 180,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.05,
      ),
      itemCount: icons.length,
      itemBuilder: (context, index) {
        final item = icons[index];
        return ExampleCard(
          label: item.label,
          child: ElectricIcon(
            item.icon,
            size: size * 0.72,
            color: color,
            semanticLabel: item.label,
          ),
        );
      },
    );
  }
}