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
    super.key
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

  /// Retorna uma nova instância do símbolo com propriedades sobrescritas.
  ElectricShape copyWith({double? size, Color? color, double? strokeWidth});

}
