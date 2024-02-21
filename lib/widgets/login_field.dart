import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const LoginField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: TextFormField(
          style: const TextStyle(color: Colors.black),
          controller: controller,
          cursorColor: const Color.fromARGB(255, 37, 66, 73),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.grey.shade600),
            contentPadding: const EdgeInsets.all(20),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 37, 66, 73),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: hintText,
          ),
        ),
      ),
    );
  }
}
