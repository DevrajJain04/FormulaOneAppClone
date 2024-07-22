import 'package:flutter/material.dart';
import 'dart:async';

class DelayedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const DelayedButton({super.key, required this.text, required this.onPressed});

  @override
  State<DelayedButton> createState() => DelayedButtonState();
}

class DelayedButtonState extends State<DelayedButton> {
  bool _isButtonEnabled = true;

  void _handleButtonPress() {
    widget.onPressed();
    setState(() {
      _isButtonEnabled = false;
    });

    Timer(const Duration(seconds: 30), () {
      setState(() {
        _isButtonEnabled = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _isButtonEnabled ? _handleButtonPress : null,
      child: Text(widget.text),
    );
  }
}