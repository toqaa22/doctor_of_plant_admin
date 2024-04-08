import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_plan_admin/home_page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../toast.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();

  bool obscure = true;
  IconData suffixIcon = Icons.visibility_off;

  void login(BuildContext context) {
    emit(LoginLoading());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text)
        .then((value) {
      FirebaseFirestore.instance.collection('admin').doc(value.user!.uid).get().then((value) {
        if (value.data()!['type'] == 'admin') {
          emit(LoginSuccessfully());
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => const RootPage()));
        } else {
          emit(LoginError());
         showToast( 'No Authorization');
        }
      }).catchError((onError) {
        emit(LoginError());
       showToast( onError.message.toString());
      });
    }).catchError((onError) {
      emit(LoginError());
      showToast( onError.message.toString());
    });
  }

  void suffixPressed() {
    obscure = !obscure;
    if (obscure) {
      suffixIcon = Icons.visibility_off;
      emit(ChangeObscure());
    } else {
      suffixIcon = Icons.visibility;
      emit(ChangeObscure());
    }
  }

  void clearTextFormFields() {
    emailController.clear();
    passwordController.clear();
    emit(ClearAllTextFormFields());
  }
}
