import 'package:electric_shapes/src/models.dart';
import 'package:electric_shapes/src/shapes/electric_shape/electric_shape.dart';
import 'package:flutter/material.dart';

/// Símbolo de aterramento projetado.
///
/// Representa a versão projetada com anel circular externo e linhas internas.
class AterramentoProjetadoSymbol extends ElectricShape {
  /// Cria um símbolo de aterramento projetado.
  const AterramentoProjetadoSymbol({
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
      size: Size(size * 2.1, size),
      painter: _AterramentoProjetadoPainter(
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
    return AterramentoProjetadoSymbol(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
      latLong: latLong ?? this.latLong,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
    );
  }
}

class _AterramentoProjetadoPainter extends CustomPainter {
  _AterramentoProjetadoPainter({
    required this.color,
    this.strokeWidth,
  });

  final Color color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.height;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth ?? s * 0.045
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final center = Offset(size.width * 0.23, size.height * 0.5);
    final radius = s * 0.42;

    // Círculo externo
    canvas.drawCircle(center, radius, paint);

    // Linha horizontal saindo à direita
    canvas.drawLine(
      Offset(center.dx + radius, center.dy),
      Offset(size.width * 0.97, center.dy),
      paint,
    );

    // Linhas verticais internas
    final x1 = center.dx - radius * 0.38;
    final x2 = center.dx;
    final x3 = center.dx + radius * 0.42;

    // Linha interna esquerda (menor)
    canvas.drawLine(
      Offset(x1, center.dy - radius * 0.28),
      Offset(x1, center.dy + radius * 0.38),
      paint,
    );

    // Linha interna central (média)
    canvas.drawLine(
      Offset(x2, center.dy - radius * 0.58),
      Offset(x2, center.dy + radius * 0.60),
      paint,
    );

    // Linha interna direita (maior)
    canvas.drawLine(
      Offset(x3, center.dy - radius * 0.86),
      Offset(x3, center.dy + radius * 0.86),
      paint,
    );
  }

  @override
  bool shouldRepaint(
      covariant _AterramentoProjetadoPainter oldDelegate,
      ) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
