// TODO re create adahi register screen

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nash_code/data/data_source/local/user_model.dart';
import 'package:nash_code/logic/cubit.dart';
import 'package:nash_code/logic/register_cubit/cubit.dart';
import 'package:nash_code/logic/register_cubit/states.dart';
import 'package:nash_code/logic/states.dart';
import 'package:nash_code/ui/login_screen.dart';
import 'package:nash_code/ui/shared/app_color.dart';
import 'package:nash_code/ui/shared/app_eunm.dart';
import 'package:nash_code/ui/shared/app_strings.dart';
import 'package:nash_code/ui/shared/helper_methods.dart';
import 'package:nash_code/ui/shared/helper_widget.dart';

class SignUpScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocConsumer<SignUpCubit, SignUpStates>(
          listener: (context, state) {
            if (state is RegisterLoadingState) {
              showProgressDialog(
                context: context,
                text: 'please wait ...',
              );
            }

            if (state is RegisterSuccessState) {
              Navigator.pop(context);
              navigateAndFinish(
                context,
                LoginScreen(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim(),
                ),
              );
              showToast(
                massage: 'created',
                color: ToastColors.SUCCESS,
              );
            }

            if (state is RegisterErrorState) {
              Navigator.pop(context);
              showProgressDialog(
                context: context,
                text: 'in use',
                error: true,
              );
            }
          },
          builder: (context, state) => Scaffold(
            backgroundColor: kSecondaryColor,
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Hero(
                              tag: 'inOutHeroTag',
                              child: CircleAvatar(
                                child:
                                    ClipOval(child: Image.asset(kSheepPhoto)),
                                radius: 90,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              CustomTextFormField(
                                  title: 'Name',
                                  keyboardType: TextInputType.text,
                                  controller: nameController,
                                  prefixIcon: Icons.person),
                              SizedBox(
                                height: 10.0,
                              ),
                              CustomTextFormField(
                                  title: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  prefixIcon: Icons.email),
                              SizedBox(
                                height: 10.0,
                              ),
                              CustomTextFormField(
                                title: 'Password',
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                prefixIcon: Icons.lock,
                                obscureText: true,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              CustomTextFormField(
                                title: 'Phone',
                                keyboardType: TextInputType.number,
                                controller: phoneController,
                                prefixIcon: Icons.phone_android,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              CustomTextFormField(
                                title: 'address',
                                keyboardType: TextInputType.text,
                                controller: addressController,
                                prefixIcon: Icons.location_city,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: CustomFancyButton(
                            buttonTitle: 'Sign Up'.toUpperCase(),
                            onPressed: () =>
                                _checkValidationAndSignUP(context: context),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(
                                context,
                                LoginScreen(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  'I have an account',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  void _checkValidationAndSignUP({@required BuildContext context}) {
    if (nameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {
      showToast(
        massage: 'Please enter your data',
        color: ToastColors.ERROR,
      );
    } else {
      if (!emailController.text.trim().contains('@')) {
        showToast(
          massage: 'Please enter a valid email',
          color: ToastColors.ERROR,
        );
      } else if (passwordController.text.trim().length < 6) {
        showToast(
          massage: 'your password must be at least 6 char',
          color: ToastColors.ERROR,
        );
      } else {
        SignUpCubit.get(context).authenticationAndSaveUserInfo(
            user: User(
          userName: nameController.text.trim(),
          userEmail: emailController.text.trim(),
          userPassword: passwordController.text.trim(),
          userPhone: phoneController.text.trim(),
        ));
      }
    }
  }
}
