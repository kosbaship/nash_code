import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nash_code/logic/cubit.dart';
import 'package:nash_code/logic/states.dart';
import 'package:nash_code/ui/shared/helper_methods.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('====================');
    return Scaffold(
      appBar: AppBar(
        title: Text('Start'),
      ),
      body: BlocConsumer<HomeCubit, HomeStats>(
        listener: (context, state) {
          if (state is HomeChangeCounterState) {
            showSnackBar(context: context, massage: 'Counter Done');
          }
        },
        builder: (context, state) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text('${HomeCubit.get(context).uiString}',
                  style: Theme.of(context).textTheme.headline4),
              Text(
                '${HomeCubit.get(context).counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: HomeCubit.get(context).getDataFromServer,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
