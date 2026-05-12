import 'package:electric_shapes/src/models.dart';
import 'package:flutter/material.dart';

/// Exibe uma etiqueta visual com as coordenadas de um simbolo.
///
/// Esse widget mostra um icone de localizacao e o texto formatado de
/// [latLong], usando variacoes da [color] informada para harmonizar com o
/// simbolo principal.
class LatlongDescWidget extends StatelessWidget {

  /// Cria o widget de descricao de latitude e longitude.
  const LatlongDescWidget({
    super.key,
    required this.size,
    required this.latLong,
    required this.color
  });

  /// Tamanho usado no icone e no texto da descricao.
  final double size;

  /// Coordenadas exibidas abaixo do simbolo.
  final LatLong latLong;

  /// Cor base usada para compor fundo, borda e conteudo.
  final Color color;

  @override
  Widget build(BuildContext context) {
    final lightColor = Color.alphaBlend(
        Colors.white.withValues(alpha: 0.7),
        color
    );
    final darkColor = Color.alphaBlend(
        Colors.black.withValues(alpha: 0.5),
        color
    );
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightColor,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: darkColor)
      ),
      child: Row(
        mainAxisSize: .min,
        spacing: 8,
        children: [
          Icon(
            Icons.location_pin,
            size: size,
            color: darkColor,
          ),
          Flexible(
            child: Text(
              '${latLong.latitude}, ${latLong.longitude}',
              maxLines: 1,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: size,
                fontWeight: FontWeight.bold,
                color: darkColor
              ),
            ),
          )
        ],
      ),
    );
  }
}
