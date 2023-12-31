import 'package:flutter/material.dart';
import 'package:puzzle_map/res/palette.dart';
import 'package:puzzle_map/screens/puzzle_solo_screen.dart';

class SoloButton extends StatelessWidget {
  const SoloButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Palette.violet,
          onSurface: Palette.violet,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          side: const BorderSide(
            width: 2,
            color: Palette.violet,
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const PuzzleSoloScreen(),
            ),
            (route) => false,
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Solo',
            style: TextStyle(fontSize: 22),
          ),
        ),
      ),
    );
  }
}
