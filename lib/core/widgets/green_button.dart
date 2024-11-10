import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonName;
  final Color? buttonColor;
  final bool? isLoading;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.buttonName,
    required this.buttonColor,
    this.isLoading
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(buttonColor),
          padding: WidgetStateProperty.all(const EdgeInsets.symmetric(vertical: 15)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
        ),
        onPressed: isLoading ?? false ? () {} : onPressed,
        child: isLoading ?? false ? Container(width: 30, height: 30, child: const CircularProgressIndicator(color: Colors.white, semanticsLabel: 'Loading',)) : Text(
          buttonName,
          style: const TextStyle(
            fontSize: 19,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}