import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  const DestinationCard({required this.name, required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          children: [
            Image.asset(imageUrl, fit: BoxFit.cover, height: 200, width: 200),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(name, style: GoogleFonts.cairo
              (fontWeight: FontWeight.bold,fontSize: 25)),
            ),
          ],
        ),
      ),
    );
  }
}
