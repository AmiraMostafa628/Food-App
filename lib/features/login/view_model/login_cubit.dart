import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/features/login/view_model/login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialStates());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPasswordInVisible = true;
  IconData suffixIcon = Icons.visibility;

  changePasswordVisibility() {
    isPasswordInVisible = !isPasswordInVisible;
    isPasswordInVisible
        ? suffixIcon = Icons.visibility
        : suffixIcon = Icons.visibility_off;

    emit(ChangePasswordVisibilityStates());
  }

  bool isChecked = false;

  changeCheckedBox(value) {
    isChecked = value;
    emit(ChangeCheckBoxValueStates());
  }

  var email = '';
  void changeLoginEmail({required var newEmail}) {
    email = newEmail;
    emit(LoginEmailChangeStates());
  }

  Future userLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginLoadingState());

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user!.emailVerified) {

        emit(LoginSuccessState(userCredential.user!.uid));
      } else {
        userCredential.user!.sendEmailVerification();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AwesomeDialog(
            context: context,
            title: 'Error',
            desc: 'EmailAddress not verified please check your email.',
            btnOkColor: ColorManager.primaryColor,
            btnOkOnPress: () {
              Navigator.pop;
            },
          ).show();
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AwesomeDialog(
            context: context,
            title: 'Error',
            desc: 'No user found for this email.',
            btnOkColor: ColorManager.primaryColor,
            btnOkOnPress: () {
              Navigator.pop;
            },
          ).show();
        });

        emit(LoginErrorState());
      } else if (e.code == 'wrong-password') {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          AwesomeDialog(
            context: context,
            title: 'Error',
            desc: 'Wrong password provided for that user.',
            btnOkColor: ColorManager.primaryColor,
            btnOkOnPress: () {
              Navigator.pop;
            },
          ).show();
        });
        emit(LoginErrorState());
      }
    }
  }
}
