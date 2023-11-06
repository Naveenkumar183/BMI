import 'package:flutter/material.dart';

class Refactorcode extends StatelessWidget {
  final Color colour;
  final Widget? cardchild;
  final Function? onPress;
  Refactorcode({required this.colour,this.cardchild,this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap:() {
        if (onPress != null) {
          onPress!(); // Call the function if it's not null
        }
      },

      child: Container(
        child:cardchild,
        margin:EdgeInsets.all(15.0),
        decoration:BoxDecoration(
            color:colour,
            borderRadius:BorderRadius.circular(10.0)
        ),

      ),
    );
  }
}