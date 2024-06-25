

import '../entities/item.dart';

abstract class ProductRepository {
  Future<List<Item>> getProducts();
 
}