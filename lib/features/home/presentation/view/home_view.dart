import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planet_app/features/home/presentation/view/widget/custom_bottom_navigation.dart';
import 'package:planet_app/features/home/presentation/view_model.dart/app_cubit/app_cubit.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late AppCubit appCubit;
  @override
  void initState() {
    appCubit = BlocProvider.of<AppCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.green,
                Color(0xff73c8a9),

                Colors.black.withOpacity(0.3)
                // Color(0xff373b44),
                // Colors.grey,
              ])),
          child: appCubit.taps[appCubit.currentIndex],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: appCubit.currentIndex,
        onTap: (index) {
          appCubit.changetap(index: index);
          setState(() {});
        },
      ),
    );
  }
}
