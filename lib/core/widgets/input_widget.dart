import 'package:flutter/material.dart';

class DefaultInput extends StatefulWidget {
  final TextEditingController controller;
  final String inputTitle;
  final bool isPassword;
  final bool isNumber;
  final bool isFloat;

  const DefaultInput({
    super.key,
    required this.controller,
    required this.inputTitle,
    this.isPassword = false,
    this.isNumber = false,
    this.isFloat = false
  });

  @override
  State<DefaultInput> createState() => _DefaultInputState();
}

class _DefaultInputState extends State<DefaultInput> {
  bool _isObscured = false;

  @override
  void initState() {
    _isObscured = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        keyboardType: widget.isNumber ? const TextInputType.numberWithOptions() : widget.isFloat ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.datetime,
        controller: widget.controller,
        obscureText: _isObscured,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          labelText: widget.inputTitle,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 70, 144, 72)
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(255, 27, 128, 31)),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(255, 27, 128, 31)),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color.fromARGB(255, 103, 204, 106)),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
              : null,
        ),
      ),
    );
  }
}