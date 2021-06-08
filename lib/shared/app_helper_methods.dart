import 'package:adahi_eidapp/database/remote_db/authentication.dart';
import 'package:adahi_eidapp/database/remote_db/cloud_firesore.dart';
import 'package:adahi_eidapp/shared/app_colors.dart';
import 'package:adahi_eidapp/shared/app_enum.dart';
import 'package:adahi_eidapp/shared/app_helper_widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

initApp() {
  AuthenticationService();
  CloudService();
}

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
