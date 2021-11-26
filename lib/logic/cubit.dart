import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nash_code/data/data_source/remote/cloud_firestore.dart';
import 'package:nash_code/logic/states.dart';

class HomeCubit extends Cubit<HomeStats> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int counter = 0;
  String uiString = 'Start';

  CloudFirestoreService _service = CloudFirestoreService();

  getDataFromServer() {
    _service.getDatafromServer().then((value) {
      uiString = value;
      emit(HomeGetDataFromServerState());
    });
  }

  void incrementCounter() {
    counter++;
    emit(HomeChangeClounterState());
  }
}
