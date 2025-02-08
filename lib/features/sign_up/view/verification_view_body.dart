import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/utils/resources/cache_helper.dart';
import 'package:food_app/core/utils/resources/color_manager.dart';
import 'package:food_app/core/utils/resources/go_router.dart';
import 'package:food_app/core/utils/shared_widgets/custom_button.dart';
import 'package:food_app/features/sign_up/view_model/sign_up_cubit.dart';
import 'package:food_app/features/sign_up/view_model/sign_up_states.dart';
import 'package:go_router/go_router.dart';

class VerificationViewBody extends StatelessWidget {
  VerificationViewBody({super.key, required this.emailAddress,});

  final TextEditingController codeController = TextEditingController();
  final String emailAddress;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit,SignUpStates>(
        listener: (context,state){
          if(state is EmailVerificationSuccessState)
          {
            if (context.mounted) {
              GoRouter.of(context).pushReplacementNamed(AppRouter.kLocationAccess);
              CacheHelper.saveData(key: 'isLoggedIn', value: true);
            }
          }
        },
        builder: (context,state){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'We have sent a code to your email',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  emailAddress,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'you can use resend option after 30 sec ',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                    onPressed: () async {
                      await Future.delayed(const Duration(seconds: 30),(){
                        if(context.mounted){SignUpCubit.get(context).sendEmailVerification(context);}
                        WidgetsBinding.instance.addPostFrameCallback((_){
                          AwesomeDialog(
                            context: context,
                            title: 'Verification',
                            desc: 'check your email to verify it.',
                            descTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Colors.black
                            ),
                            btnOkColor: ColorManager.primaryColor,
                            btnOkOnPress: () {
                              Navigator.pop;
                            },

                          ).show();
                        });

                      }
                      );

                    },
                    text: 'Resend'),
                const SizedBox(height: 20,),
              ],
            ),
          );
        });
  }
}