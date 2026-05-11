import 'package:electric_shapes/electric_shapes.dart';
import 'package:electric_shapes/src/models.dart';
import 'package:electric_shapes/src/shapes/electric_shape/electric_shape.dart';
import 'package:flutter/material.dart';

/// Símbolo de chave religadora existente.
///
/// Mostra um retângulo com o texto `RL` e saída horizontal para a rede.
class ChaveReligadoraExistenteSymbol extends ElectricShape {
  /// Cria um símbolo de chave religadora existente.
  const ChaveReligadoraExistenteSymbol({
    super.key,
    super.size = 180,
    super.color = const Color(0xFF2F3437),
    super.strokeWidth = 1,
    super.latLong,
    super.text,
    super.fontSize = 16
  });

  @override
  Widget buildShape(BuildContext context) {
    return CustomPaint(
      size: Size(size * 2.2, size),
      painter: _ChaveReligadoraExistentePainter(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }

  @override
  /// Retorna uma cópia do símbolo com as propriedades informadas.
  ElectricShape copyWith({
    double? size,
    Color? color,
    double? strokeWidth,
    String? text,
    double? fontSize,
    LatLong? latLong
  }) {
    return ChaveReligadoraExistenteSymbol(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
      latLong: latLong ?? this.latLong,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}

class _ChaveReligadoraExistentePainter extends CustomPainter {
  _ChaveReligadoraExistentePainter({
    required this.color,
    this.strokeWidth,
  });

  final Color color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.height;
    final stroke = strokeWidth ?? s * 0.045;

    final strokePaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final rect = Rect.fromLTWH(
      size.width * 0.08,
      size.height * 0.12,
      size.height * 0.78,
      size.height * 0.76,
    );

    // Quadrado
    canvas..drawRect(rect, strokePaint)

    // Linha horizontal saindo à direita
    ..drawLine(
      Offset(rect.right, rect.center.dy),
      Offset(size.width * 0.96, rect.center.dy),
      strokePaint,
    );

    // Texto "RL"
    final textPainter = TextPainter(
      text: TextSpan(
        text: 'RL',
        style: TextStyle(
          color: color,
          fontSize: rect.height * 0.42,
          fontWeight: FontWeight.w500,
          height: 1,
        ),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout();

    final textOffset = Offset(
      rect.center.dx - textPainter.width / 2,
      rect.center.dy - textPainter.height / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(
      covariant _ChaveReligadoraExistentePainter oldDelegate,
      ) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
