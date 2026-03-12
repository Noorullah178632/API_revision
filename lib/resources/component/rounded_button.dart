import 'package:api_revision/resources/appColors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final VoidCallback onpress;

  const RoundedButton({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpress;
      },
      child: Container(
        width: 200, // Full width
        height: 55, // Ideal mobile height
        decoration: BoxDecoration(
          color: Appcolors.buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
