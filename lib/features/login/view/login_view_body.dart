import 'package:flutter/material.dart';
import 'package:food_app/core/utils/resources/cache_helper.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_text_form_field.dart';
import 'package:food_app/features/login/view/or_login_widget.dart';
import 'package:food_app/features/login/view_model/login_cubit.dart';
import 'package:food_app/features/login/view_model/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/sign_up/view_model/sign_up_cubit.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if(state is LoginSuccessState){
          SignUpCubit.get(context).getUserData(state.uId);
          GoRouter.of(context).pushReplacement(AppRouter.kLocationAccess);
          CacheHelper.saveData(key: 'isLoggedIn', value: true);
          CacheHelper.saveData(key: 'uId', value: state.uId);

        }
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email'.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: ColorManager.labelColor,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormField(
                    text: 'example@gmail.com',
                    textEditingController: emailController,
                    color: ColorManager.fillTextFieldColor,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Email Can\'t be Empty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Password'.toUpperCase(),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: ColorManager.labelColor,
                        fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CustomTextFormField(
                    text: '**********',
                    type: TextInputType.visiblePassword,
                    color: ColorManager.fillTextFieldColor,
                    isPassword: cubit.isPasswordInVisible,
                    suffixIcon: cubit.suffixIcon,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'password is too short';
                      }
                      return null;
                    },
                    suffixPressed: () {
                      cubit.changePasswordVisibility();
                    },
                    textEditingController: passwordController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: cubit.isChecked,
                          activeColor: Colors.green,
                          side: const BorderSide(
                              color: Color(0xffE3EBF2), width: 2),
                          onChanged: (value) {
                            cubit.changeCheckedBox(value);
                          }),
                      Expanded(
                        child: Text(
                          'Remember Me',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kForgetPassword);
                        },
                        child: Text(
                          'Forgot Password',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                            color: ColorManager.primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    onPressed: (){
                      if (formKey.currentState!.validate()){
                        LoginCubit.get(context).
                        userLogin(email: emailController.text,
                            password: passwordController.text, context: context);
                      }

                    },
                    text: 'log in',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextButton(
                            onPressed: () {
                              GoRouter.of(context).push(AppRouter.kSignUpView);
                            },
                            child: Text(
                              "sign up".toUpperCase(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.primaryColor),
                            ))
                      ],
                    ),
                  ),
                  OrLoginWidget(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
