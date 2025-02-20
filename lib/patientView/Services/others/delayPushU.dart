import 'package:flutter/material.dart';

Future delayPushU(BuildContext context, String page) async {
  await new Future.delayed(const Duration(milliseconds: 0), () {
    Navigator.pushReplacementNamed(context, page);
  });
}
