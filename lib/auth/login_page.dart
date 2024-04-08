import 'package:doctor_plan_admin/auth/widget/custom_textfield.dart';
import 'package:doctor_plan_admin/cubit/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Center(
                child: ListView(
                  children: [
                    Image.asset(
                      'assets/img.png',
                      scale: 5,
                    ),
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextfield(
                      obscureText: false,
                      hintText: 'Enter Email',
                      icon: Icons.alternate_email,
                      controller: cubit.emailController,
                    ),
                    CustomTextfield(
                      obscureText: true,
                      hintText: 'Enter Password',
                      icon: Icons.lock,
                      controller: cubit.passwordController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    state is LoginLoading
                        ? const Center(child: CircularProgressIndicator())
                        : GestureDetector(
                      onTap: () {
                        cubit.login(context);
                      },
                      child: Container(
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Constants.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: const Center(
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
