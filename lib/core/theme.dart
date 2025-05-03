import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' hide AssetManifest;

final ThemeData appTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: Color(0xFFD12567),
    onPrimary: Colors.white,
    background: Color(0xFFFFFFFF),
    onBackground: Color(0xFF333333),
  ),
  textTheme: GoogleFonts.interTextTheme(),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
