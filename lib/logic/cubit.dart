import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nash_code/data/data_source/local/user_model.dart';
import 'package:nash_code/data/data_source/remote/authentication.dart';
import 'package:nash_code/data/data_source/remote/cloud_firestore.dart';
import 'package:nash_code/logic/states.dart';

class HomeCubit extends Cubit<HomeStats> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int counter = 0;
  String uiString = 'Start';

  CloudFirestoreService _service = CloudFirestoreService();

  getDataFromServer() {
    _service.getDataFromServer().then((value) {
      uiString = value;
      emit(HomeGetDataFromServerState());
    });
  }

  void incrementCounter() {
    counter++;
    emit(HomeChangeCounterState());
  }

  // method : to register a new user

  // authenticationAndSaveUserInfo({@required user, mode}) {
  //   emit(SignUpLoadingState());
  //
  //   AuthenticationService.signUp(user: user)
  //       .then((userCredential) => CloudFirestoreService.saveUserInfo(
  //                   user: user(
  //             userID: userCredential.user.uid,
  //             userName: user.userName,
  //             userEmail: user.userEmail,
  //             userPassword: user.userPassword,
  //             userPhone: user.userPhone,
  //           )).then((value) => emit(SignUpSuccessState())).catchError(
  //                 (error) => emit(SignUpErrorState(error.toString())),
  //               ))
  //       .catchError(
  //         (error) => emit(SignUpErrorState(error.toString())),
  //       );
  // }

  //====== method for sign in page =========
  // String currentMode = 'user';
  // String adminMode = 'admin';
  // String userMode = 'user';
  //
  // changeToAdminMode() {
  //   currentMode = adminMode;
  //   emit(LoginAdminState());
  // }
  //
  // changeToUserMode() {
  //   currentMode = userMode;
  //   emit(LoginUserState());
  // }
  //
  // signInAsAdmin(mode) {
  //   emit(LoginSuccessState(mode));
  // }
  //
  // authenticationAndSaveUser({@required user, mode}) async {
  //   emit(LoginLoadingState());
  //
  //   await AuthenticationService.signIn(user: user).then((userCredential) {
  //     emit(LoginSuccessState(mode));
  //   }).catchError(
  //     (error) => emit(LoginErrorState(error.toString())),
  //   );
  // }
  //
  // getUserData() {}

//======  end method for sign in page =========

}
