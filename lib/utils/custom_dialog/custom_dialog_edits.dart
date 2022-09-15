import 'package:admin/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CustomDialogEdits extends StatelessWidget {
  const CustomDialogEdits(
      {Key? key,
      required this.modulo, this.onPressed,
      required this.podeEditar,
      required this.dateUltimoUpdate})
      : super(key: key);

  final String modulo;
  final Function()? onPressed;
  final bool podeEditar;
  final DateTime dateUltimoUpdate;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alerta de Edição',
          style: GoogleFonts.montserrat(
              color: bgColor, fontWeight: FontWeight.w600)),
      content: podeEditar ? Text(
          '$modulo só pode ser editado 1 vez a cada 30 dias! proximá edição em '
          '${DateFormat('dd/MM/yyyy').format(DateTime.now().add(const Duration(days: 30)))}',
          style: GoogleFonts.montserrat(fontSize: 12)) :
      Text(
          '$modulo não pode ser editado, proximá edição em ${calcuaDateProximaEdicao(dateUltimoUpdate)} dias!',
          style: GoogleFonts.montserrat(fontSize: 12)),
      actions: [
        TextButton(
            style: TextButton.styleFrom(primary: Colors.grey.shade400),
            onPressed: podeEditar ? onPressed : () => Navigator.of(context).pop(),
            child: Text(
              podeEditar ? 'Editar' : 'ENTENDIDO',
              style:
                  GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold),
            )),
        podeEditar ? TextButton(
            style: TextButton.styleFrom(primary: bgColor),
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Não', style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.bold))) : Container()
      ],
    );
  }

  int calcuaDateProximaEdicao(DateTime dateUltimoUpdate){
    final dataAtual = DateTime.now();
    return dataAtual.difference(dateUltimoUpdate).inDays;
  }
}
