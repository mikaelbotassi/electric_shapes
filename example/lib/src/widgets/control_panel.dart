import 'package:example/src/widgets/slider_field.dart';
import 'package:flutter/material.dart';

const _palette = <Color>[
  Color(0xFF22333B),
  Color(0xFF0A6E5A),
  Color(0xFFBC6C25),
  Color(0xFFB23A48),
  Color(0xFF3D5A80),
];

class ControlPanel extends StatelessWidget{
  const ControlPanel({
    super.key,
    required this.size,
    required this.strokeWidth,
    required this.color,
    required this.onSizeChanged,
    required this.onStrokeWidthChanged,
    required this.onColorChanged,
  });

  final double size;
  final double strokeWidth;
  final Color color;
  final ValueChanged<double> onSizeChanged;
  final ValueChanged<double> onStrokeWidthChanged;
  final ValueChanged<Color> onColorChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Color(0xFFE4DDCF)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preview controls',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              SizedBox(
                width: 220,
                child: SliderField(
                  label: 'Size',
                  value: size,
                  min: 32,
                  max: 140,
                  onChanged: onSizeChanged,
                ),
              ),
              SizedBox(
                width: 220,
                child: SliderField(
                  label: 'Stroke',
                  value: strokeWidth,
                  min: 1,
                  max: 8,
                  onChanged: onStrokeWidthChanged,
                ),
              ),
              Wrap(
                spacing: 8,
                children: _palette.map((swatch) {
                  final isSelected = swatch.toARGB32() == color.toARGB32();
                  return InkWell(
                    borderRadius: BorderRadius.circular(999),
                    onTap: () => onColorChanged(swatch),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 160),
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: swatch,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected ? Colors.black : Colors.white,
                          width: isSelected ? 3 : 1,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x22000000),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}