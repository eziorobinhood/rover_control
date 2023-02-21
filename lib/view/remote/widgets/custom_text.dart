import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.txt,
  }) : super(key: key);
  final String txt;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10, top: 10),
          child: Text(
            txt,
            style:
                GoogleFonts.ptSerif(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}