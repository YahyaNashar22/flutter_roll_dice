import "package:flutter/material.dart";
import "package:roll_dice/gradient_container.dart";

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: GradientContainer(const Color.fromARGB(255, 80, 2, 38),
            const Color.fromARGB(255, 84, 7, 98)),
      ),
    ),
  );
}
