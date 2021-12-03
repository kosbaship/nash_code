import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nash_code/data/data_source/remote/authentication.dart';
import 'package:nash_code/data/data_source/remote/cloud_firestore.dart';
import 'package:nash_code/ui/shared/app_color.dart';
import 'package:nash_code/ui/shared/app_eunm.dart';
import 'package:nash_code/ui/shared/helper_widget.dart';

initApp() {
  AuthenticationService();
  CloudFirestoreService();
}

showSnackBar({@required BuildContext context, @required String massage}) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(massage),
      duration: Duration(seconds: 3),
    ));

navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Future<bool> showToast(
        {@required String massage,
        @required ToastColors color,
        Toast toastLength = Toast.LENGTH_SHORT,
        ToastGravity gravity = ToastGravity.BOTTOM}) =>
    Fluttertoast.showToast(
      msg: massage,
      toastLength: toastLength,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: setToastColor(color),
      textColor: Colors.white,
      fontSize: 16.0,
    );
Color setToastColor(ToastColors toastColor) {
  Color color;

  switch (toastColor) {
    case ToastColors.ERROR:
      color = kToastError;
      break;
    case ToastColors.SUCCESS:
      color = kToastSuccess;
      break;
    case ToastColors.WARNING:
      color = kToastWarning;
      break;
  }
  return color;
}

Future<AlertDialog> showProgressDialog(
        {@required BuildContext context,
        @required String text,
        error = false}) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(8),
        backgroundColor: Theme.of(context).primaryColor,
        content: Container(
          color: Theme.of(context).secondaryHeaderColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    if (!error)
                      CircularProgressIndicator(
                          backgroundColor: Theme.of(context).primaryColor),
                    if (!error)
                      SizedBox(
                        width: 20.0,
                      ),
                    Expanded(
                      child: Text(
                        text,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                if (error) SizedBox(height: 20.0),
                if (error)
                  CustomFancyButton(
                    onPressed: () => Navigator.pop(context),
                    buttonTitle: "Cancel",
                  ),
              ],
            ),
          ),
        ),
      ),
    );

Future<dynamic> navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );

//alert design
showLoading(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Please wait ..'),
          content: Container(
            height: 50.0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      });
}
