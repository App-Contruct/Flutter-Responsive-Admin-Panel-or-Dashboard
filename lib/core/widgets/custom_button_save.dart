import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.onPressed, this.color = Colors.blue}) : super(key: key);

  final Function()? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
          ),
          onPressed: onPressed,
          child: Text(
            'Salvar'.toUpperCase(),
            style: const TextStyle(fontSize: 16),
          ),
        ),
      );
  }
}
