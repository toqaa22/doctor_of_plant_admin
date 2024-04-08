import 'package:doctor_plan_admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
showToast(String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    backgroundColor: Constants.primaryColor.withOpacity(0.7),
    textColor: Colors.white,
    fontSize: 16.0);