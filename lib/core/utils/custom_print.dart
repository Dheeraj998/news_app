import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

customPrint(String text) {
  if (kDebugMode) print(text);
}

customLog(String text) {
  if (kDebugMode) log(text);
}

class SlideUpPageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  SlideUpPageRoute({required this.builder})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 1.0), // Start sliding from bottom
                  end: Offset.zero,
                ).animate(animation),
                child: child);
          },
          transitionDuration:
              const Duration(milliseconds: 500), // Adjust duration here
        );
}
