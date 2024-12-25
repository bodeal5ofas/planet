import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planet_app/features/home/presentation/view/widget/planet_tap/custom_button.dart';

class SelectForm extends StatelessWidget {
  const SelectForm({super.key, required this.image});
final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.black.withOpacity(0.7)),
      child: Row(
        children: [
          const Column(
            children: [
              CustomButton(
                iconData: Icons.image_outlined,
                title: 'Gallery',
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                iconData: Icons.camera_alt_outlined,
                title: 'Camera',
              ),
            ],
          ),
          const Spacer(),
          Image.asset(
            image,
            fit: BoxFit.fill,
            height: 200,
          ),
        ],
      ),
    );
  }
}
