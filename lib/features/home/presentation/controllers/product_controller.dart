

import 'package:flutter_application_delivery/features/home/domain/repository/product_repository.dart';
import 'package:flutter_application_delivery/features/home/domain/use_cases/get_product.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

import '../../domain/entities/item.dart';

class ProductController extends GetxController {


   @override 
  void onInit() {
    super.onInit();
    // Aquí puedes cargar tus productos, por ejemplo:
    getProducts();
  }
  ProductController(){
    repo = Get.find<ProductRepository>();
    useCase = ProductUseCase(repo);
  }

 RxList<Item> products = <Item>[].obs;
 RxList<Item> filteredProducts = <Item>[].obs; // Lista para los productos filtrados

  late ProductRepository repo;
  late ProductUseCase  useCase;


  Future<void> getProducts() async {
    var result = await useCase.call();
    products.assignAll(result);
    filteredProducts.assignAll(result);
  
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(products);
    } else {
      filteredProducts.assignAll(
        products.where((item) => item.category.toLowerCase().contains(query)).toList(),
      );
    }
  }
}