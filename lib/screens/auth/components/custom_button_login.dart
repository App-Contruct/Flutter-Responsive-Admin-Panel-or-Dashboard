import 'package:flutter/material.dart';

class CustomButtonLogin extends StatelessWidget {
  const CustomButtonLogin(
      {Key? key,
      required this.onPressed,
      this.color = Colors.blue,
      required this.title})
      : super(key: key);

  final Function()? onPressed;
  final Color? color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 40, vertical: MediaQuery.of(context).size.height / 75),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5),
        ),
        onPressed: onPressed,
        child: Text(
          title.toUpperCase(),
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
