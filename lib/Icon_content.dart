import 'package:flutter/material.dart';
import 'global file.dart';
class Custom extends StatelessWidget {
  final String str;
  final IconData icon;
  Custom({required this.str,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center ,
      children: [
        Icon(
            icon,
            color:Colors.white,
            size:80.0
        ),
        SizedBox(
          height:15.0,
        ),
        Text(
            str,
            style:labelone
        )
      ],
    );
  }
}
