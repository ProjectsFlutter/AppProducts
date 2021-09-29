import 'package:app_products/providers/productForm-provider.dart';
import 'package:app_products/services/services.dart';
import 'package:app_products/ui/inputDecorations-ui.dart';
import 'package:app_products/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
 
   @override
   Widget build(BuildContext context) {
     final productService = Provider.of<ProductService>(context);
     
     return ChangeNotifierProvider(
       create: ( _ ) => ProductFormProvider(productService.selectedProduct),
       child: _ProductScreenBody(productService: productService),
     );
    //  return _ProductScreenBody(productService: productService);
   }
 }

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductService productService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
               children: [
                 ProductImage(productUrlImg: productService.selectedProduct.picture,),
                 Positioned(
                   left: 20,
                   top: 40,
                   child: IconButton(
                     onPressed: () => Navigator.of(context).pop(),
                     icon: Icon(Icons.arrow_back_ios_outlined, size:40, color: Colors.black),
                   ),
                 ),
                 Positioned(
                   right: 20,
                   top: 40,
                   child: IconButton(
                     onPressed: (){

                     },
                     icon: Icon(Icons.camera_alt_outlined, size:40, color: Colors.black),
                   ),
                 ),
               ],
            ),
            _ProductForm(),
            SizedBox(height: 100.0,)
          ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save_outlined),
          onPressed: (){},
        ),
      );
  }
}

class _ProductForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.0), bottomRight: Radius.circular(25.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0,5),
              blurRadius: 5
            )
          ]
        ),
        child: Form(
          child: Column(
            children: [
              SizedBox(height: 10.0),
              TextFormField(
                initialValue: product.name,
                onChanged: (value)=> product.name = value,
                validator:(value){
                  if( value == null || value.length < 1){
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: InputDecorations.authInputDecoration(hint_text: 'Nombre del producto', label_text: 'Nombre:'),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                initialValue: product.price.toString(),
                onChanged: (value){
                  if(double.tryParse(value) == null){
                    product.price =0;
                  }else{
                    product.price = double.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(hint_text: '\$100', label_text: 'Precio:'),
              ),
              SizedBox(height: 10.0),
              SwitchListTile.adaptive(
                title: Text('Disponible:'),
                value: product.available, 
                activeColor: Colors.indigo,
                onChanged: (value){}
              ),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}