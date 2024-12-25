import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:planet_app/features/home/presentation/view/widget/pets_tap/pets_tap.dart';
import 'package:planet_app/features/home/presentation/view/widget/planet_tap/planet_tap.dart';
import 'package:planet_app/features/home/presentation/view/widget/search_tap/search_tap.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  List<Widget> taps = const [
    PlanetTap(),
    PetsTap(),
    SearchTap(),
  ];
  int currentIndex = 0;
  changetap({required int index}) {
    currentIndex = index;
  }
}
