import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:planet_app/core/utils/app_routes.dart';
import 'package:planet_app/core/utils/assets.dart';
import 'package:planet_app/features/auth/presentation/view/widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  IconData iconPassword = Icons.visibility_off;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Welcome Back To Our Application',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text(
                  'Please sign in with your mail',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'User Name',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    hintText: 'Enter your Name', controller: nameController),
                const SizedBox(
                  height: 10,
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
                  isPasword: true,
                  suffixIcon: IconButton(
                      onPressed: () {
                        if (iconPassword == Icons.visibility_off) {
                          iconPassword = Icons.visibility;
                        } else {
                          iconPassword = Icons.visibility_off;
                        }
                        setState(() {});
                      },
                      icon: Icon(iconPassword)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Forgot password',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.5)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      //login account
                    }
                  },
                  child: Center(
                    child: Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.greenAccent),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRoutes.kregisterView);
                    },
                    child: Text(
                      'Don’t have an account? Create Account',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontSize: 18, color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
