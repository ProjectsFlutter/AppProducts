import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

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
           _BackgroundImage(),
           _ProductDetails()
          ],
        ),
      ),
    );
  }

  BoxDecoration _CardBorders() {
    return BoxDecoration(
        color: Colors.cyan[50],
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

class _ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      color: Colors.red
    );
  }
}

class _BackgroundImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: Container(
        width: double.infinity,
        height: 400.0,
        child: FadeInImage(
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://www.buscador.com/wp-content/uploads/2020/02/producto2.jpg'),
          fit: BoxFit.cover
        ),
      ),
    );
  }
}