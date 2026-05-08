import 'package:example/src/domain/models.dart';
import 'package:example/src/widgets/example_card.dart';
import 'package:flutter/material.dart';

class SymbolsTab extends StatelessWidget {
  const SymbolsTab({
    super.key,
    required this.sections,
    required this.size,
    required this.color,
    required this.strokeWidth,
  });

  final List<ShapeSection> sections;
  final double size;
  final Color color;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: sections.map((section) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                section.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: section.items.map((item) {
                  return ExampleCard(
                    label: item.label,
                    child: item.builder(
                      size: size,
                      color: color,
                      strokeWidth: strokeWidth,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}