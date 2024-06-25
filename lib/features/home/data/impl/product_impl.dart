
import 'package:flutter_application_delivery/features/home/data/services/product_services.dart';
import 'package:flutter_application_delivery/features/home/domain/repository/product_repository.dart';

import '../../domain/entities/item.dart';
import '../../domain/mapper/item_mapper.dart';
import '../models/item_model.dart';

class ProductImpl implements ProductRepository {
  final ProductService productService = ProductService();

  @override
  Future<List<Item>> getProducts() async {
    try {
      var parsedJson = await productService.loadJsonFromAssets('assets/data.json');
      List<Item> itemList = (parsedJson['items'] as List)
        .map((itemJson) => ItemMapper.modelToEntity(ItemModel.fromJson(itemJson)))
        .toList();
      return itemList;
    } catch (e) {
      
      return []; // Retorna una lista vacía en caso de error
    }
  }
}