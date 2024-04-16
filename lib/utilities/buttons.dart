import 'package:flutter/material.dart';

class RoundButtons extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const RoundButtons({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        )),
      ),
    );
  }
}
