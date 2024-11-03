 import 'package:flutter/material.dart';
 
 Widget quickAccessIcon(IconData icon, VoidCallback onPressed) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.teal),
        onPressed: onPressed,
        iconSize: 35,
      ),
    );
  }
