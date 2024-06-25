import 'package:flutter/foundation.dart';
import 'package:flutter_application_delivery/features/home/domain/repository/product_repository.dart';
import 'package:flutter_application_delivery/features/home/domain/use_cases/get_product.dart';
import 'package:flutter_application_delivery/features/home/domain/entities/item.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository repo;
  final ProductUseCase useCase;

  List<Item> _products = [];
  List<Item> _filteredProducts = [];

  List<Item> get products => _products;
  List<Item> get filteredProducts => _filteredProducts;

  ProductProvider({required this.repo}) : useCase = ProductUseCase(repo) {
    getProducts();
  }

  Future<void> getProducts() async {
    var result = await useCase.call();
    _products = result;
    _filteredProducts = result;
    notifyListeners();
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      _filteredProducts = List.from(_products);
    } else {
      _filteredProducts = _products
          .where((item) => item.category.toLowerCase().contains(query))
          .toList();
    }
    notifyListeners();
  }
}