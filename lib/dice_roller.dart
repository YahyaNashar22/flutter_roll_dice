import 'package:flutter/material.dart';
import "dart:math";
import "dart:async";

final random = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int activeDiceImage = 2;
  Timer? rollTimer;

  void rollDice() {
    // cancel previous rolls first
    rollTimer?.cancel();

    // total number of dice rolls
    int rollCount = 0;
    // Number of rolls before animation ends
    const totalRolls = 10;
    // Speed of the rolling animation
    const rollDuration = Duration(milliseconds: 100);

    rollTimer = Timer.periodic(rollDuration, (timer) {
      setState(() {
        activeDiceImage = random.nextInt(6) + 1;
      });

      rollCount++;

      // Stop the rolling after totalRolls is reached
      if (rollCount >= totalRolls) {
        rollTimer?.cancel();

        // After animation ends, set the final dice image
        setState(() => activeDiceImage = random.nextInt(6) + 1);
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    title: const Text("Dice Rolled!"),
                    content: Text("The final result is : $activeDiceImage"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("Ok"),
                      )
                    ]));
      }
    });
  }

  @override
  void dispose() {
    // Clean ip the timer if the widget is disposed
    rollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          "images/dice-$activeDiceImage.png",
          width: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          style: TextButton.styleFrom(
              foregroundColor: Colors.white70,
              textStyle: const TextStyle(fontSize: 28)),
          onPressed: rollDice,
          child: const Text("Roll Dice"),
        )
      ],
    );
  }
}
