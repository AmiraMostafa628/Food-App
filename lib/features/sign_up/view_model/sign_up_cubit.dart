import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/models/user_model.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/features/sign_up/view_model/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() :super(SignUpInitialStates());

  static SignUpCubit get(context) => BlocProvider.of(context);

  bool isPasswordInVisible = true;
  IconData suffixIcon = Icons.visibility;

  changePasswordVisibility() {
    isPasswordInVisible = !isPasswordInVisible;
    isPasswordInVisible ? suffixIcon = Icons.visibility : suffixIcon =
        Icons.visibility_off;

    emit(ChangePasswordVisibilityStates());
  }
  bool isRetypePasswordInVisible = true;
  IconData retypePasswordSuffixIcon = Icons.visibility;

  changeReTypePasswordVisibility() {
    isRetypePasswordInVisible = !isRetypePasswordInVisible;
    isRetypePasswordInVisible ? retypePasswordSuffixIcon =
        Icons.visibility : retypePasswordSuffixIcon =
        Icons.visibility_off;

    emit(ChangeRetypePasswordVisibilityStates());
  }


  isUserNameValid(String userName) {
    if (userName.isEmpty) {
      return 'Username can\'t be Empty';
    }
    else if (userName.length > 30) {
      return 'Username can\'t be larger than 30 letter';
    }
    else if (userName.length < 2) {
      return 'Username can\'t be less than 2 letter';
    }
  }

  isPasswordValid(String password) {
    if (password.isEmpty) {
      return 'Password can\'t be Empty';
    }
    else if (password.length > 50) {
      return 'Password can\'t be larger than 50 digit';
    }
    else if (password.length < 6) {
      return 'Password can be at least 6 digit';
    }
  }

  matchPassword({required String value, required String password}) {
    if (value.isEmpty) {
      return 'Confirm password can\'t be empty';
    }
    else if (value != password) {
      return 'Passwords do not match';
    }
  }

  String? isEmailValid(String email) {
    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email)) {
      return null;
    } else {
      return 'Enter a valid email';
    }
  }

  Future userSignUp({
    required String email,
    required String password,
    required String name,
    required BuildContext context}) async {
    emit(SignUpLoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.
      instance.
      createUserWithEmailAndPassword(email: email, password: password);
      if(!userCredential.user!.emailVerified){
        User? user = FirebaseAuth.instance.currentUser;
        await user!.sendEmailVerification().then((value){
          listenToAuthStateChanges(user);
        });

      }
        userCreate(name, email, userCredential.user!.uid);


      emit(SignUpSuccessState(userCredential.user!.uid));
    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {
        WidgetsBinding.instance.addPostFrameCallback((_){
          AwesomeDialog(
            context: context,
            title: 'Error',
            desc: 'The password provided is too weak.',
            descTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black
            ),
            btnOkColor: ColorManager.primaryColor,
            btnOkOnPress: () {
              Navigator.pop;
            },

          ).show();
        });


        emit(SignUpErrorState());
      }
      else if (e.code == 'email-already-in-use') {
        WidgetsBinding.instance.addPostFrameCallback((_){
          AwesomeDialog(
            context: context,
            title: 'Error',
            descTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black
            ),
            desc: 'The account already exists for that email.',
            btnOkColor: ColorManager.primaryColor,
            btnOkOnPress: () {
              Navigator.pop;
            },
          ).show();
        });

        emit(SignUpErrorState());
      }

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(SignUpErrorState());
    }
  }

  void userCreate(String name, String email, String uId) {
    UserModel model = UserModel(
        name: name,
        email: email,
        uId: uId,
      isVerified: false,
    );
    FirebaseFirestore
        .instance
        .collection('users')
        .doc(uId)
        .set(model.toMap()!).then((value) {
      getUserData(uId);
      emit(SignUpCreateUserSuccessState());
    }).catchError((error) {
      emit(SignUpCreateUserErrorState(error));
    });
  }

  UserModel? userModel;

  void getUserData(uId) {
    emit(GetUserLoadingState());

    FirebaseFirestore.instance.collection('users')
        .doc(uId)
        .get()
        .then((value) {
      userModel = UserModel.fromJson(value.data()!);
      emit(GetUserSuccessState());
    })
        .catchError((error) {
      emit(GetUserErrorState(error.toString()));
    });
  }


  Future<void> sendEmailVerification(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
       }
    }
  void listenToAuthStateChanges(user) async{
    if (user != null) {
      await user.reload();
      if (user.emailVerified) {
        try {
          await FirebaseFirestore.instance.collection('users')
              .doc(user.uid)
              .update({
            'isVerified': true,
          });

          if (kDebugMode) {
            print("User verification status updated successfully");
          }

          emit(EmailVerificationSuccessState());
        } catch (error) {
          if (kDebugMode) {
            print("Error updating user verification status: $error");
          }
        }
      }
    }
  }



}



