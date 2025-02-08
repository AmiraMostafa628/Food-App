import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/cache_helper.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/core/utils/shared_widgets/custom_text_form_field.dart';
import 'package:food_app/features/sign_up/view_model/sign_up_cubit.dart';
import 'package:food_app/features/sign_up/view_model/sign_up_states.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});

  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reTypePasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context,state){
        if(state is SignUpSuccessState)
          {
            CacheHelper.saveData(key: 'uId', value: state.uId).then((value){
              if(context.mounted) {
                SignUpCubit.get(context).getUserData(state.uId);
                GoRouter.of(context).pushReplacement(
                    AppRouter.kVerificationView, extra: emailController.text);
                //SignUpCubit.get(context).sendEmailVerification(context);
              }
            });
          }

      },
      builder: (context, state) {
        SignUpCubit cubit = SignUpCubit.get(context);
        return Form(
          key: formKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'username'.toUpperCase(),
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: ColorManager.labelColor,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  text: 'John doe',
                  textEditingController: userNameController,
                  color: ColorManager.fillTextFieldColor,
                  type: TextInputType.text,
                  validate: (value) {
                    return cubit.isUserNameValid(value);
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
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
                      return cubit.isEmailValid(value);
                    }),
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
                    return cubit.isPasswordValid(value);
                  },
                  suffixPressed: () {
                    cubit.changePasswordVisibility();
                  },
                  textEditingController: passwordController,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Re-Type Password',
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
                  isPassword: cubit.isRetypePasswordInVisible,
                  suffixIcon: cubit.retypePasswordSuffixIcon,
                  validate: (value) {
                    return cubit.matchPassword(
                        value: value, password: passwordController.text);
                  },
                  suffixPressed: () {
                    cubit.changeReTypePasswordVisibility();
                  },
                  textEditingController: reTypePasswordController,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      cubit
                          .userSignUp(
                              email: emailController.text,
                              password: passwordController.text,
                              name: userNameController.text,
                              context: context);
                    }
                  },
                  text: 'Sign up',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
