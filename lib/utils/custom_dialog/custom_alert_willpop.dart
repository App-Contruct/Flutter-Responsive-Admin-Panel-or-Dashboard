
import 'package:admin/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAlertWillPop extends StatelessWidget {
  const CustomAlertWillPop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alerta',
          style: GoogleFonts.montserrat(
              color: bgColor, fontWeight: FontWeight.w600)),
      content: Text(
          'Ao retornar todas as informações não salvas serão perdidas!',
          style: GoogleFonts.montserrat(fontSize: 14)),
      actions: [
        TextButton(
            style: TextButton.styleFrom(primary: Colors.grey.shade400),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: Text(
              'Sim',
              style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
            )),
        TextButton(
            style: TextButton.styleFrom(primary: bgColor),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text(
                'Não', style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold)))
      ],
    );
  }
}
