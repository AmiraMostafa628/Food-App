import 'package:flutter/material.dart';
import 'package:food_app/core/utils/shared_widgets/custom_background_container.dart';
import 'package:food_app/core/utils/shared_widgets/custom_container.dart';
import 'package:food_app/features/login/view/login_view_body.dart';

class LoginView extends StatelessWidget {
   const LoginView({super.key});


  @override
  Widget build(BuildContext context) {
    return CustomBackgroundContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const SizedBox(
              height: 150,
            ),
            Text('Log In',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10,),
            Text('Please sign in to your existing account',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 50,),
            CustomContainer(child: LoginViewBody()),
          ],
        ),);
  }
}



