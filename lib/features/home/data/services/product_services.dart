// file: lib/service/json_loader_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';

class ProductService {
  // Método para cargar datos JSON desde assets
  Future<Map<String, dynamic>> loadJsonFromAssets(String path) async {
    try {
      // Carga el string raw desde el archivo en assets
      final jsonString = await rootBundle.loadString(path);
      // Decodifica el string a un objeto JSON
      final jsonResponse = json.decode(jsonString);
      return jsonResponse;
    } catch (e) {
      return {}; // Devuelve un mapa vacío en caso de error
    }
  }
}
