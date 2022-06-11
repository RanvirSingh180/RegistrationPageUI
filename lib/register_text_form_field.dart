import 'package:flutter/material.dart';
import 'main.dart';

class RegisterTextFormField extends StatelessWidget {
  final bool hiddenText;
  final String label;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final TextInputType? keyboardInputType;
  const RegisterTextFormField(
      {Key? key,
      required this.label,
      this.validator,
      required this.controller,
      this.hiddenText = false,
      this.keyboardInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
          validator: validator,
          obscureText: hiddenText,
          keyboardType: keyboardInputType,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(left: 15),
            labelText: label,
            fillColor: Colors.white,
            filled: true,
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: tfTextColor),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: tfColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: tfColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: tfColor),
            ),
          )),
    );
  }
}

