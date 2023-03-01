import 'package:amazon_clone/presentation/resources/color_manager.dart';
import 'package:amazon_clone/presentation/resources/strings.dart';
import 'package:amazon_clone/presentation/resources/styles/button_style.dart';
import 'package:amazon_clone/presentation/resources/styles/textFormField_style.dart';
import 'package:amazon_clone/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/presentation/auth/services/auth_service.dart';

// Global Variables
enum Auth {
  signIn,
  signUp,
}

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  Auth _auth = Auth.signUp;

  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  // void signInUser() {
  //   authService.signInUser(
  //     context: context,
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.welcome,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ListTile(
                  tileColor: _auth == Auth.signUp
                      ? ColorManager.backgroundColor
                      : ColorManager.greyBackgroundColor,
                  title: Text(
                    AppStrings.createAccount,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  leading: Radio(
                    activeColor: ColorManager.secondaryColor,
                    value: Auth.signUp,
                    groupValue: _auth,
                    onChanged: (Auth? val) {
                      setState(() {
                        _auth = val!;
                      });
                    },
                  ),
                ),
                if (_auth == Auth.signUp)
                  Padding(
                    padding: const EdgeInsets.all(AppPadding.p8),
                    child: Container(
                      color: ColorManager.backgroundColor,
                      child: Form(
                        key: _signUpFormKey,
                        child: Expanded(
                          child: Column(
                            children: [
                              getTextFormField(
                                controller: _nameController,
                                hintText: AppStrings.name,
                              ),
                              const SizedBox(height: 10),
                              getTextFormField(
                                  controller: _emailController,
                                  hintText: AppStrings.email,
                                  textInputType: TextInputType.emailAddress),
                              const SizedBox(height: 10),
                              getTextFormField(
                                  controller: _passwordController,
                                  hintText: AppStrings.password,
                                  obscureText: true),
                              const SizedBox(height: 10),
                              getButton(
                                  text: AppStrings.signUp,
                                  onTap: () {
                                    if (_signUpFormKey.currentState!
                                        .validate()) {
                                      signUpUser();
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ListTile(
                    tileColor: _auth == Auth.signIn
                        ? ColorManager.backgroundColor
                        : ColorManager.greyBackgroundColor,
                    title: Text(
                      AppStrings.signIn,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    leading: Radio(
                      activeColor: ColorManager.secondaryColor,
                      value: Auth.signIn,
                      groupValue: _auth,
                      onChanged: (Auth? val) {
                        setState(() {
                          _auth = val!;
                        });
                      },
                    )),
                const SizedBox(height: 10),
                if (_auth == Auth.signIn)
                  Form(
                      child: Column(
                    children: [
                      getTextFormField(
                          controller: _emailController,
                          hintText: AppStrings.email),
                      const SizedBox(height: 10),
                      getTextFormField(
                          controller: _emailController,
                          hintText: AppStrings.password),
                      const SizedBox(height: 10),
                      getButton(
                          text: AppStrings.signIn,
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              //signUpUser();
                            }
                          }),
                    ],
                  ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
}
