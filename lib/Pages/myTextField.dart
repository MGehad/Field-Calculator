import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final String label;
  final TextEditingController control;
  final bool canWrite;
  const MyTextField(
      {required this.label,
      required this.control,
      required this.canWrite,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: TextField(
          textAlignVertical: TextAlignVertical.bottom,
          keyboardType: TextInputType.number,
          readOnly: !canWrite,
          controller: control,
          maxLines: 1,
          inputFormatters: [
            LengthLimitingTextInputFormatter(20),
            FilteringTextInputFormatter.allow(RegExp(r'(^\-?\d*\.?\d*)')),
          ],
          style: TextStyle(fontFamily: 'Times', fontSize: 20),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 13, 10, 10),
              isDense: true,
              labelText: label,
              border: const OutlineInputBorder(),
              labelStyle: const TextStyle(fontFamily: 'Times', fontSize: 24)),
        ));
  }
}
