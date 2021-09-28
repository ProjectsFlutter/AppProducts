import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Widget child;

  const CardContainer({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric( horizontal: 30.0),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        decoration: _CardShape(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _CardShape(){
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 15.0,
          offset: Offset(0,5)
        ),
      ]
    );
  }
}