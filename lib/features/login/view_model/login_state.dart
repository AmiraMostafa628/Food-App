abstract class LoginStates{}

class LoginInitialStates extends LoginStates{}

class ChangePasswordVisibilityStates extends LoginStates{}

class ChangeCheckBoxValueStates extends LoginStates{}

class LoginEmailChangeStates extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates{
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginStates{}