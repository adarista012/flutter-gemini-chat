import 'package:flutter/material.dart';
import 'dart:math';

Widget iconSendMessage(void Function()? onPressed, Color color) {
  return Transform.rotate(
    angle: -15 * pi / 180,
    child: IconButton(
      onPressed: onPressed,
      color: color,
      icon: const Icon(
        Icons.send,
        grade: -25,
      ),
    ),
  );
}
