// file: lib/domain/mappers/item_mapper.dart
import '../../data/models/item_model.dart';
import '../entities/item.dart';


class ItemMapper {
  static Item modelToEntity(ItemModel model) {
    return Item(
      category: model.category,
      quantity: model.quantity,
      image: model.image,
    );
  }
}
