import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.validate,
    this.obscureText: false,
  }) : super(key: key);

  final hintText;
  final obscureText;
  final validate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.all(25.0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black, width: 1.0),
                  borderRadius: BorderRadius.circular(5.0)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 2.0),
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ],
      ),
    );
  }
}
