import 'package:flutter/material.dart';
class Mybutton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const Mybutton({super.key,
  required this.text,
  required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Center( 
          child: Text(text),
        ),
      ),
    );
  }
}