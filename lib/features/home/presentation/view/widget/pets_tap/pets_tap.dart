import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:planet_app/features/home/presentation/view/widget/planet_tap/select_form.dart';

class PetsTap extends StatelessWidget {
  const PetsTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Select Insect !",
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 20,
          ),
          const SelectForm(
            image: 'assets/images/pet.png',
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.withOpacity(0.2),
              ),
              onPressed: () {},
              child: const Text(
                'Get Report',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
