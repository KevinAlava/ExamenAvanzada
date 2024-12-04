import '../logica/distancia.dart';

class DistanciaController {
  final Distancia _distanciaService = Distancia();

  /// Devuelve la distancia calculada como un string para la interfaz.
  String obtenerDistancia(String x1Str, String y1Str, String x2Str, String y2Str) {
    try {
      final x1 = double.parse(x1Str);
      final y1 = double.parse(y1Str);
      final x2 = double.parse(x2Str);
      final y2 = double.parse(y2Str);

      final distancia = _distanciaService.calcularDistancia(x1, y1, x2, y2);
      return distancia.toStringAsFixed(2);
    } catch (e) {
      return "Error: Datos inválidos.";
    }
  }
}
