import 'package:flutter/widgets.dart';
import 'package:planet_app/features/home/presentation/view/widget/search_tap/custom_text_field.dart';

class SearchTap extends StatelessWidget {
  const SearchTap({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      SizedBox(height: 10,),
      CustomTextField(),
    ],);
  }
}