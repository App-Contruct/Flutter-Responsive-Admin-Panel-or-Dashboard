import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.prefixIcon,
      required this.inputType,
      this.initialValue,
      this.sufixIcon,
      this.errorText,
      this.onChanged,
      this.inputFormatter,
      this.controller,
      this.validator,
      this.obscureText = false,
      this.readOnly = true,
      this.maginOrizontal = 50,
      this.maginVertical = 4,
      this.maxLines = 1,
      this.colorUnderline,
      this.fillColor = Colors.black12})
      : super(key: key);

  final String hintText;
  final IconData? prefixIcon;
  final TextInputType inputType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatter;
  final String? errorText;
  final Function(String)? onChanged;
  final Widget? sufixIcon;
  final double maginOrizontal;
  final double maginVertical;
  final Color fillColor;
  final Color? colorUnderline;
  final bool readOnly;
  final String? initialValue;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: maginOrizontal, vertical: maginVertical),
      child: TextFormField(
        maxLines: maxLines,
        initialValue: initialValue,
        enabled: readOnly,
        cursorColor: Colors.grey.shade800,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          fillColor: fillColor,
          filled: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: colorUnderline != null
                    ? colorUnderline!
                    : Colors.blue,
                width: 3),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade50)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          contentPadding: const EdgeInsets.all(15),
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          errorText: errorText,
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: Colors.grey,
                )
              : null,
          suffixIcon: sufixIcon,
        ),
        style: GoogleFonts.montserrat(color: Colors.grey.shade600),
        onChanged: onChanged,
        inputFormatters: inputFormatter,
        obscureText: obscureText!,
        validator: validator,
        keyboardType: inputType,
      ),
    );
  }
}
