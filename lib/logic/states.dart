abstract class HomeStats {}

class HomeInitialState extends HomeStats {}

class HomeChangeCounterState extends HomeStats {}

class HomeGetDataFromServerState extends HomeStats {}

//SignUp states

class SignUpInitialState extends HomeStats {}

class SignUpLoadingState extends HomeStats {}

class SignUpSuccessState extends HomeStats {}

class SignUpErrorState extends HomeStats {
  final error;
  SignUpErrorState(this.error);
}
// ==SignUp=========== end states ==============

//===========signIN ========states ==========
// class LoginInitialState extends HomeStats {}
//
// class LoginLoadingState extends HomeStats {}
//
// class LoginSuccessState extends HomeStats {
//   final mode;
//
//   LoginSuccessState(this.mode);
// }
//
// class LoginErrorState extends HomeStats {
//   final error;
//   LoginErrorState(this.error);
// }
//
// class LoginUserState extends HomeStats {}
//
// class LoginAdminState extends HomeStats {}
//===========signIN ======== end states ==========
