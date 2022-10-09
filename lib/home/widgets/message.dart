import 'package:atulya/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../main.dart';

String stripMessage(String errorMessage) {
  return errorMessage
      .replaceAll(RegExp(r'\].*'), "")
      .replaceAll(RegExp(r'^\[.*?\/'), "");
}

void showError(String error) {
  Fluttertoast.showToast(
    msg: stripMessage(error.toString()),
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 7,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 12.0,
  );
}

void showInfo(String info) {
  Fluttertoast.showToast(
    msg: stripMessage(info),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 7,
    backgroundColor: Colors.green.withOpacity(0.6),
    textColor: Colors.white,
    fontSize: 12.0,
  );
}

void showMessage(String info) {
  Fluttertoast.showToast(
    msg: stripMessage(info),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 7,
    backgroundColor: Colors.blue.withOpacity(0.6),
    textColor: Colors.white,
    fontSize: 12.0,
  );
}

void showErrorSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: ListTile(
        leading: const Icon(
          Icons.cancel_rounded,
          size: 40,
          color: Colors.black54,
        ),
        title: Text(
          stripMessage(message),
          style: cardTextStyle(context),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.redAccent,
      elevation: 5.0,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      // action: SnackBarAction(
      //   label: "DISMISS",
      //   onPressed: () {},
      // ),
    ),
  );
}

void showMessageSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: ListTile(
        leading: const Icon(
          Icons.message_rounded,
          size: 50,
          color: Colors.black54,
        ),
        title: Text(
          stripMessage(message),
          style: cardTextStyle(context),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: themeBlue,
      elevation: 5.0,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      // action: SnackBarAction(
      //   label: "DISMISS",
      //   onPressed: () {},
      // ),
    ),
  );
}

void showInfoSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: ListTile(
        leading: const Icon(
          Icons.info_rounded,
          size: 50,
          color: Colors.black54,
        ),
        title: Text(
          stripMessage(message),
          style: cardTextStyle(context),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      backgroundColor: Colors.greenAccent,
      elevation: 5.0,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
      // action: SnackBarAction(
      //   label: "DISMISS",
      //   onPressed: () {},
      // ),
    ),
  );
}

void showMessageBanner(String message, {bool dismiss = false}) {
  globalScaffoldMessenger.currentState
    ?..removeCurrentMaterialBanner()
    ..showMaterialBanner(
      MaterialBanner(
        //backgroundColor: Colors.blue,
        content: Text(message),
        //contentTextStyle: const TextStyle(color: Colors.white),
        onVisible: () => !dismiss
            ? null
            : Future.delayed(
                const Duration(seconds: 7),
                () => globalScaffoldMessenger.currentState!
                    .hideCurrentMaterialBanner(),
              ),
        actions: [
          TextButton(
            //style: TextButton.styleFrom(foregroundColor: Colors.white),
            onPressed: () {
              globalScaffoldMessenger.currentState!.hideCurrentMaterialBanner();
            },
            child: const Text("DISMISS"),
          )
        ],
      ),
    );
}
