import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateInput extends StatefulWidget {
  final TextEditingController controller;
  final String inputTitle;
  const CustomDateInput({
    super.key,
    required this.controller,
    required this.inputTitle
  });

  @override
  State<CustomDateInput> createState() => _CustomDateInputState();
}

class _CustomDateInputState extends State<CustomDateInput> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        widget.controller.text = DateFormat('yyyy-MM-dd').format(pickedDate); // Format date as needed
      });
    }
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: 'Birth Date',
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
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
        suffixIcon: IconButton(
          icon: const Icon(Icons.calendar_today, color: Color.fromARGB(255, 48, 136, 51),),
          onPressed: () => _selectDate(context),
        ),
      ),
      readOnly: true,
      onTap: () => _selectDate(context),
    );
  }
}