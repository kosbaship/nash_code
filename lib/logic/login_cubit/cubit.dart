import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nash_code/data/data_source/local/user_model.dart';
import 'package:nash_code/data/data_source/remote/authentication.dart';
import 'package:nash_code/logic/login_cubit/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  String currentMode = 'user';
  String adminMode = 'admin';
  String userMode = 'user';

  changeToAdminMode() {
    currentMode = adminMode;
    emit(LoginAdminState());
  }

  changeToUserMode() {
    currentMode = userMode;
    emit(LoginUserState());
  }

  signInAsAdmin(mode) {
    emit(LoginSuccessState(mode));
  }

  authenticationAndSaveUserInfo({user, mode}) {
    emit(LoginLoadingState());

    AuthenticationService.signIn(user: user).then((userCredential) {
      emit(LoginSuccessState(mode));
    }).catchError(
      (error) => emit(LoginErrorState(error.toString())),
    );
  }
}
