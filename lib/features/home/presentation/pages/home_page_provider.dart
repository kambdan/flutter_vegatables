import 'package:flutter/material.dart';
import 'package:flutter_application_delivery/features/home/presentation/provider/product_provider.dart';
import 'package:flutter_application_delivery/shared/colors.dart';
import 'package:flutter_application_delivery/shared/text_styles.dart';
import 'package:provider/provider.dart';

import '../../../../shared/custom_app_bar.dart';
// Asegúrate de que la ruta sea correcta

class HomePageProvider extends StatefulWidget {
  const HomePageProvider({super.key});

  @override
  State<HomePageProvider> createState() => _HomePageProviderState();
}

class _HomePageProviderState extends State<HomePageProvider> {
  int _selectedIndex = 0; // Añade esta línea

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:  15, right: 15),
        child: Column(
        
          children: [
            const SizedBox(height: 20), // Espacio entre el appbar y el search bar (opcional
            searchInput(),
            const SizedBox(height: 40), // Espacio entre el search bar y el grid (opcional
            cardProducts(),
          ],
        ),
      ),
       bottomNavigationBar: customBottomNavigation(),
    );
  }

  BottomNavigationBar customBottomNavigation() {
    return BottomNavigationBar(
  items: const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Inicio',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Carrito',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Perfil',
    ),
  ],
  currentIndex: _selectedIndex,
  selectedItemColor: CustomColors.letterTittle,
  onTap: _onItemTapped,
);
  }

  Expanded cardProducts() {
    return Expanded(
            child: Consumer<ProductProvider>(
              builder: (context, productProvider, child){
              return GridView.builder(
              itemCount: productProvider.filteredProducts.length,  // Asegúrate de actualizar según tu controlador
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dos elementos por fila
                childAspectRatio: 1, // Ratio del tamaño del item (ancho / alto)
                crossAxisSpacing: 10, // Espacio horizontal entre los elementos
                mainAxisSpacing: 10, // Espacio vertical entre los elementos
              ),
              itemBuilder: (context, index) {
                final item = productProvider.filteredProducts[index];  // Usando productos filtrados
                return Container(
                  
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // Cambios de posición de la sombra
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8), // Padding dentro del contenedor
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Flexible(child: Image.asset(item.image, width: 150, height: 150)),
                     // Imagen del producto
                      Text(item.category, style: AppTextStyle.titleCategory),
                      Text('Cantidad: ${item.quantity}'),
                    ],
                  ),
                );
              },
            );
            })
          );
  }

 Padding searchInput() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 40,
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          labelText: 'Buscar',
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.blue, width: 1.0),  // Color del borde en estado normal
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.black12, width: 1.0),  // Color del borde cuando el TextField está habilitado pero no tiene el foco
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Colors.black38, width: 2.0),  // Color del borde cuando el TextField está enfocado
          ),
        ),
        onChanged: (value){
          Provider.of<ProductProvider>(context, listen: false).searchProduct(value.toLowerCase());
        },
      ),
    ),
  );
}

}
