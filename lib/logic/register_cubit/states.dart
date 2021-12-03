abstract class SignUpStates {}

class RegisterInitialState extends SignUpStates {}

class RegisterLoadingState extends SignUpStates {}

class RegisterSuccessState extends SignUpStates {}

class RegisterErrorState extends SignUpStates {
  final error;
  RegisterErrorState(this.error);
}
