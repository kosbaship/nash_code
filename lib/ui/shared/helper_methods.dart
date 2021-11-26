import 'package:flutter/material.dart';

showSnackBar({@required BuildContext context, @required String massage}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(massage),
      duration: Duration(seconds: 3),
    ));
