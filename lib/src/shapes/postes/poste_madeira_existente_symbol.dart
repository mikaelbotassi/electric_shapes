import 'package:electric_shapes/src/shapes/electric_shape.dart';
import 'package:flutter/material.dart';

/// Símbolo de poste de madeira existente.
///
/// É representado por um círculo simples com contorno.
class PosteMadeiraExistenteSymbol extends ElectricShape {
  /// Cria um símbolo de poste de madeira existente.
  const PosteMadeiraExistenteSymbol({
    super.key,
    super.size = 180,
    super.color = const Color(0xFF2F3437),
    super.strokeWidth = 1,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _PosteMadeiraExistentePainter(
        color: color,
        strokeWidth: strokeWidth,
      ),
    );
  }

  @override
  /// Retorna uma cópia do símbolo com as propriedades informadas.
  ElectricShape copyWith({double? size, Color? color, double? strokeWidth}) {
    return PosteMadeiraExistenteSymbol(
      color: color ?? this.color,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      size: size ?? this.size,
    );
  }
}

class _PosteMadeiraExistentePainter extends CustomPainter {
  _PosteMadeiraExistentePainter({
    required this.color,
    this.strokeWidth,
  });

  final Color color;
  final double? strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.shortestSide;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth ?? s * 0.045
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = s * 0.39;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(
      covariant _PosteMadeiraExistentePainter oldDelegate,
      ) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
