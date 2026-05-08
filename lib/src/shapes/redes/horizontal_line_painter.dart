import 'package:flutter/cupertino.dart';

/// `CustomPainter` reutilizável para símbolos lineares de rede.
///
/// Pode desenhar uma linha contínua ou tracejada, de acordo com [isDashed].
class HorizontalLinePainter extends CustomPainter {
  /// Cria um pintor de linha horizontal.
  HorizontalLinePainter({
    required this.color,
    required this.strokeWidth,
    required this.isDashed,
  });

  /// Cor aplicada à linha.
  final Color color;

  /// Espessura da linha.
  final double? strokeWidth;

  /// Define se a linha será contínua ou tracejada.
  final bool isDashed;

  @override
  void paint(Canvas canvas, Size size) {
    final stroke = strokeWidth ?? 1;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..isAntiAlias = true;

    final y = size.height * 0.5;
    final startX = size.width * 0.04;
    final endX = size.width * 0.96;

    if (!isDashed) {
      canvas.drawLine(
        Offset(startX, y),
        Offset(endX, y),
        paint,
      );
      return;
    }

    final dashLength = size.width * 0.16;
    final dashGap = size.width * 0.07;

    var currentX = startX;

    while (currentX < endX) {
      final nextX = (currentX + dashLength).clamp(startX, endX);

      canvas.drawLine(
        Offset(currentX, y),
        Offset(nextX, y),
        paint,
      );

      currentX += dashLength + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant HorizontalLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.isDashed != isDashed;
  }
}
