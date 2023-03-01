import 'package:flutter/material.dart';

ElevatedButton getButton( {Key? key , required String text, required VoidCallback onTap, Color? color})
=> ElevatedButton(key: key, onPressed: onTap, child: Text(text,
    //style: TextStyle(color: color == null? ColorManager.backgroundColor : ColorManager.black)
));