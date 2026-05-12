import 'package:electric_shapes/src/models.dart';
import 'package:electric_shapes/src/shapes/electric_shape/latlong_desc_widget.dart';
import 'package:flutter/material.dart';

/// Contrato base para todos os símbolos elétricos desenhados via `CustomPaint`.
///
/// As implementações devem respeitar [size], [color] e [strokeWidth], além de
/// fornecer uma forma de clonagem por meio de [copyWith].
abstract class ElectricShape extends StatelessWidget {

  /// Cria a configuração comum usada pelos símbolos do pacote.
  const ElectricShape({
    required this.size,
    required this.color,
    required this.strokeWidth,
    required this.fontSize,
    this.text,
    this.latLong,
    super.key,
  });

  /// Tamanho base do símbolo.
  ///
  /// Cada implementação pode interpretar esse valor para definir largura e
  /// altura finais do desenho.
  final double size;

  /// Cor principal usada no desenho do símbolo.
  final Color color;

  /// Espessura do traço usada pelo `CustomPainter`.
  final double strokeWidth;

  /// Texto opcional exibido abaixo do simbolo.
  final String? text;

  /// Tamanho da fonte aplicado ao texto e a descricao de coordenadas.
  final double fontSize;

  /// Coordenadas opcionais mostradas abaixo do simbolo.
  final LatLong? latLong;

  /// Retorna uma nova instância do símbolo com propriedades sobrescritas.
  ElectricShape copyWith({
    double? size,
    Color? color,
    double? strokeWidth,
    String? text,
    double? fontSize,
    Object? latLong = const Object(),
  });

  /// Constroi apenas a representacao visual principal do simbolo.
  ///
  /// Elementos auxiliares, como [text] e [latLong], sao adicionados pela
  /// implementacao base de [build].
  @protected
  Widget buildShape(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final darkColor = Color.alphaBlend(
      Colors.black.withValues(alpha: 0.8),
      color
    );
    final shape = buildShape(context);

    return Column(
      mainAxisSize: .min,
      spacing: 8,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            if (!constraints.hasBoundedWidth) {
              return shape;
            }

            return SizedBox(
              width: constraints.maxWidth,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                alignment: Alignment.center,
                child: shape,
              ),
            );
          },
        ),
        if(latLong != null)
          LatlongDescWidget(size: fontSize*0.6, latLong: latLong!, color: color),
        if(text != null && text!.isNotEmpty)
          Text(
            text!,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: fontSize,
              color: darkColor
            ),
          )
      ],
    );
  }

}
