import 'package:app_products/models/models.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.only(top: 30.0),
        width: double.infinity,
        height: 400.0,
        decoration: _CardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
           _BackgroundImage(url: product.picture),
           _ProductDetails(productId: product.id!, productName: product.name,),
           Positioned(top: 0, right: 0, child: _PriceTag(productPrice: product.price,)),
           if(!product.available)
              Positioned(top: 0, left: 0, child: _NotAvailable()),
          ],
        ),
      ),
    );
  }

  BoxDecoration _CardBorders() {
    return BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0,7),
            blurRadius: 10.0
          )
        ]
      );
  }
}

class _NotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 70.0,
      alignment: Alignment.center,
      child: FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text('No disponible',style: TextStyle(color: Colors.white, fontSize: 20)),
        )
      ),
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), bottomRight: Radius.circular(25.0))
      ),
    );
  }
}

class _PriceTag extends StatelessWidget {
  final double productPrice;

  const _PriceTag({required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 70.0,
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text('\$$productPrice', style: TextStyle(color: Colors.white, fontSize: 20)),
        )
      ),
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25.0), bottomLeft: Radius.circular(25.0))
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  final String productName;
  final String productId;

  const _ProductDetails({required this.productName, required this.productId});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 50.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:20, vertical: 10),
        width: double.infinity,
        height: 65.0,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(this.productName,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            ),
            Text(this.productId,
            style: TextStyle(fontSize: 16)
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {

  final String? url;

  const _BackgroundImage({this.url});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        width: double.infinity,
        height: 400.0,
        child: this.url == null
        ? Image(image: AssetImage('assets/no-image.png'), fit: BoxFit.cover,)
        : FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage(this.url!),
          fit: BoxFit.cover
        ),
      ),
    );
  }
}