
import '../entities/item.dart';
import '../repository/product_repository.dart';

class ProductUseCase {
  ProductUseCase(this._productRepository);


  final ProductRepository _productRepository;

  Future<List<Item>> call() async {
    return await _productRepository.getProducts();
  }
}