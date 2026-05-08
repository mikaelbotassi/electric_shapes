import 'package:flutter/widgets.dart';

/// Widget utilitário para renderizar um ícone do pacote.
///
/// Funciona como um atalho tipado para [Icon], mantendo a mesma API
/// essencial para tamanho, cor e acessibilidade.
class ElectricIcon extends StatelessWidget {
  /// Cria um widget para exibir um [IconData] do pacote.
  const ElectricIcon(
    this.icon, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
  });

  /// Ícone exibido pelo widget.
  final IconData icon;

  /// Tamanho do ícone em pixels lógicos.
  final double? size;

  /// Cor aplicada ao ícone.
  final Color? color;

  /// Rótulo semântico usado por tecnologias assistivas.
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }
}
