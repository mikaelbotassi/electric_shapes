import 'package:electric_shapes/electric_shapes.dart';
import 'package:example/src/domain/models.dart';
import 'package:example/src/widgets/example_card.dart';
import 'package:flutter/material.dart';

enum IconRenderMode {
  flutterIcon('Icon (Fonte)', 'Icon da fonte direta (Icon)'),
  electricIcon('ElectricIcon', 'Widget do pacote (ElectricIcon)'),
  rawGlyph('Text (TTF)', 'Caractere bruto da fonte (Text)');

  const IconRenderMode(this.label, this.description);
  final String label;
  final String description;
}

class IconsTab extends StatefulWidget {
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
  State<IconsTab> createState() => _IconsTabState();
}

class _IconsTabState extends State<IconsTab> {
  IconRenderMode _renderMode = IconRenderMode.flutterIcon;
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredIcons = widget.icons.where((item) {
      if (_searchQuery.isEmpty) return true;
      final query = _searchQuery.toLowerCase();
      final labelMatches = item.label.toLowerCase().contains(query);
      final codeHex =
          '0x${item.icon.codePoint.toRadixString(16).toLowerCase()}';
      return labelMatches || codeHex.contains(query);
    }).toList();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Color(0xFFE4DDCF)),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar por nome ou código (ex: 0xF018)...',
                  prefixIcon: const Icon(Icons.search, size: 20),
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Text(
                    'Modo de renderização (${filteredIcons.length} ícones):',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SegmentedButton<IconRenderMode>(
                    segments: IconRenderMode.values.map((mode) {
                      return ButtonSegment<IconRenderMode>(
                        value: mode,
                        label: Text(mode.label),
                        tooltip: mode.description,
                      );
                    }).toList(),
                    selected: {_renderMode},
                    onSelectionChanged: (newSelection) {
                      setState(() {
                        _renderMode = newSelection.first;
                      });
                    },
                    style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: WidgetStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: filteredIcons.isEmpty
              ? const Center(
                  child: Text('Nenhum ícone encontrado.'),
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 180,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.92,
                  ),
                  itemCount: filteredIcons.length,
                  itemBuilder: (context, index) {
                    final item = filteredIcons[index];
                    final hexCode =
                        '0x${item.icon.codePoint.toRadixString(16).toUpperCase()}';
                    return ExampleCard(
                      label: item.label,
                      subtitle: hexCode,
                      child: _buildIconWidget(
                        item.icon,
                        _renderMode,
                        widget.size,
                        widget.color,
                        item.label,
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildIconWidget(
    IconData iconData,
    IconRenderMode mode,
    double size,
    Color color,
    String label,
  ) {
    final iconSize = size * 0.72;
    switch (mode) {
      case IconRenderMode.flutterIcon:
        return Icon(
          iconData,
          size: iconSize,
          color: color,
          semanticLabel: label,
        );
      case IconRenderMode.electricIcon:
        return ElectricIcon(
          iconData,
          size: iconSize,
          color: color,
          semanticLabel: label,
        );
      case IconRenderMode.rawGlyph:
        return Text(
          String.fromCharCode(iconData.codePoint),
          style: TextStyle(
            fontFamily: iconData.fontFamily,
            package: iconData.fontPackage,
            fontSize: iconSize,
            color: color,
          ),
        );
    }
  }
}
