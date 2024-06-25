import 'package:flutter_application_delivery/features/home/data/impl/product_impl.dart';
import 'package:flutter_application_delivery/features/home/domain/repository/product_repository.dart';
import 'package:flutter_application_delivery/features/home/presentation/controllers/product_controller.dart';
import 'package:get/instance_manager.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    
    //Inicia a nivel global 
    Get.put<ProductRepository>(ProductImpl());
    Get.put<ProductController>(ProductController());

    }
}