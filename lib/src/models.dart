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