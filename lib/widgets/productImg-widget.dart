import 'dart:io';

import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? productUrlImg;

  const ProductImage({Key? key, this.productUrlImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: double.infinity,
        height: 450,
        child: Opacity(
          opacity: 0.9,
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0), topRight: Radius.circular(45.0)),
            child: getImage(this.productUrlImg),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0), topRight: Radius.circular(45.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0,5)
            )
          ]
        ),
      ),
    );
  }

  Widget getImage(String? picture){

    if(picture == null){
        return Image(
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
        );
    }

    if(picture.startsWith('http')){
        return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(this.productUrlImg!),
              fit: BoxFit.cover,
        );
    }

    return Image.file(File(picture),fit: BoxFit.cover,);
  }
}