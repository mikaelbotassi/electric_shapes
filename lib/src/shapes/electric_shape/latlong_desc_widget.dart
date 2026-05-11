import 'package:flutter/material.dart';

/// Representa um par de coordenadas geograficas.
///
/// O pacote usa essa estrutura para associar latitude e longitude a um
/// simbolo eletrico.
class LatLong{

  /// Latitude em graus decimais.
  final double latitude;

  /// Longitude em graus decimais.
  final double longitude;

  /// Cria um par de coordenadas geograficas.
  const LatLong(this.latitude, this.longitude);

}

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
        spacing: 8,
        children: [
          Icon(
            Icons.location_pin,
            size: size,
            color: darkColor,
          ),
          Text(
            '${latLong.latitude}, ${latLong.longitude}',
            style: textTheme.bodyMedium?.copyWith(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: darkColor
            ),
          )
        ],
      ),
    );
  }
}
