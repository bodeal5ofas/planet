import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_app/core/custom_show_snack_bar.dart';
import 'package:planet_app/core/utils/app_routes.dart';
import 'package:planet_app/core/utils/assets.dart';
import 'package:planet_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';
import 'package:planet_app/features/auth/presentation/view_model/register_cubit/register_cubit.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController mobilController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  IconData iconPassword = Icons.visibility_off;
  bool isPassword = true;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailureState) {
          customShowSnackBar(context, state.errMessage);
        } else if (state is RegisterSuccessState) {
          customShowSnackBar(context, 'Sucess');
        } else {
          customShowSnackBar(context, 'Loading');
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.black.withOpacity(0.6),
                Colors.lightGreen,
                Colors.green,
              ])),
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    AssetsData.klogoImage,
                    fit: BoxFit.contain,
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                      hintText: 'Enter your Full Name',
                      controller: nameController),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Mobil Number',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  CustomTextFormField(
                    hintText: 'Enter your Mobil',
                    controller: mobilController,
                    textInput: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email Address',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  CustomTextFormField(
                    hintText: 'Enter your Emaill',
                    controller: emailController,
                    isEmail: true,
                  ),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFormField(
                    hintText: 'Enter your password',
                    controller: passwordController,
                    isPasword: isPassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          if (iconPassword == Icons.visibility_off) {
                            iconPassword = Icons.visibility;
                            isPassword = false;
                          } else {
                            iconPassword = Icons.visibility_off;
                            isPassword = true;
                          }
                          setState(() {});
                        },
                        icon: Icon(
                          iconPassword,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black.withOpacity(0.5)),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        //login account
                        BlocProvider.of<RegisterCubit>(context).register(
                            email: emailController.text,
                            password: passwordController.text);
                      }
                    },
                    child: Center(
                      child: Text(
                        'Register',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.greenAccent),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.kLoginView);
                    },
                    child: Text(
                      'Already Have an Acoount',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
