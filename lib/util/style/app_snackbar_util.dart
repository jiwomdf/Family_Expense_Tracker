import 'package:flutter/material.dart';

extension Ctx on BuildContext {
  void showSb(SnackBar snackBar, bool isShown) {
    Future(() {
      if (isShown) {
        ScaffoldMessenger.of(this).showSnackBar(snackBar);
      }
    });
  }

  void show(String text) {
    Future(() {
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(text)));
    });
  }

  buildCircleDialog(bool dismisable) {
    return showDialog(
        context: this,
        barrierDismissible: dismisable,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  hideDialog() {
    Navigator.of(this).pop();
  }
}
