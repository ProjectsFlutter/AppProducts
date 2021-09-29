import 'package:app_products/screens/screens.dart';
import 'package:app_products/services/product_service.dart';
import 'package:app_products/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   final productService = Provider.of<ProductService>(context);
   if(productService.isLoading) return LoadingScreen();
   
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Productos')),
      ),
      body: ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, int index)=> GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'product'),
          child: ProductCard(product: productService.products[index],)
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
      ),
    );
  }
}
