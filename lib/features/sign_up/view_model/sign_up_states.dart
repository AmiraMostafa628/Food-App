abstract class SignUpStates{}

class SignUpInitialStates extends SignUpStates{}

class ChangePasswordVisibilityStates extends SignUpStates{}

class ChangeRetypePasswordVisibilityStates extends SignUpStates{}

class SignUpEmailStates extends SignUpStates{}

class SignUpLoadingState extends SignUpStates{}

class SignUpSuccessState extends SignUpStates{
  final String uId;
  SignUpSuccessState(this.uId);
}

class SignUpErrorState extends SignUpStates{}

class SignUpCreateUserSuccessState extends SignUpStates{}

class SignUpCreateUserErrorState extends SignUpStates{
  final String error;
  SignUpCreateUserErrorState(this.error);
}

class GetUserLoadingState extends SignUpStates{}

class GetUserSuccessState extends SignUpStates{}

class GetUserErrorState extends SignUpStates{
  final String error;
  GetUserErrorState(this.error);
}

class EmailVerificationSuccessState extends SignUpStates{}

class UpdateEmailVerificationSuccessState extends SignUpStates{}