import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nash_code/data/data_source/local/user_model.dart';
import 'package:nash_code/data/data_source/remote/authentication.dart';
import 'package:nash_code/data/data_source/remote/cloud_firestore.dart';
import 'package:nash_code/logic/register_cubit/states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(RegisterInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  authenticationAndSaveUserInfo({@required User user, mode}) {
    emit(RegisterLoadingState());

    AuthenticationService.signUp(user: user)
        .then((userCredential) => CloudFirestoreService.saveUserInfo(
                    user: User(
              userID: userCredential.user.uid,
              userName: user.userName,
              userEmail: user.userEmail,
              userPassword: user.userPassword,
              userPhone: user.userPhone,
            )).then((value) => emit(RegisterSuccessState())).catchError(
                  (error) => emit(RegisterErrorState(error.toString())),
                ))
        .catchError(
          (error) => emit(RegisterErrorState(error.toString())),
        );
  }
}
