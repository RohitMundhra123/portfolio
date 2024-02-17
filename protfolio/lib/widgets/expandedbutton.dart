import 'package:flutter/material.dart';

Widget expandedButton(String title, Function()? onTap) {
  return Expanded(
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.white),
        onPressed: onTap,
        child: Text(title)),
  );
}
