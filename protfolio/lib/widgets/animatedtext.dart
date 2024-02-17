import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

secondaryTypeWriter(String title) {
  return TypewriterAnimatedText(
    title,
    cursor: "",
    curve: Curves.easeInOut,
    textStyle: const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
  );
}

primaryTypeWriter(String title) {
  return TypewriterAnimatedText(
    title,
    cursor: "",
    curve: Curves.easeInOut,
    textStyle: const TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  );
}
