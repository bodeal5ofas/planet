import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.iconData});
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey.withOpacity(0.25),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.white,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(title),
        ],
      ),
    );
  }
}
