import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_network_repository/presentation/flutter_network_repository.dart';

List<T> parseList<T>(
  data,
  T Function(Map<String, dynamic>) fromJson,
) {
  final parsedData = (data as List?)?.cast<Map<String, dynamic>>();
  return parsedData?.map(fromJson).toList().cast<T>() ?? [];
}

Future<void> showToast(String message) async {
  if (appContext.mounted) {
    showDialog(
      context: appContext,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (context) {
        Timer.periodic(const Duration(seconds: 2), (timer) {
          Navigator.of(context, rootNavigator: true).pop('dialog');
          timer.cancel();
        });

        return Dialog(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          insetAnimationCurve: Curves.easeIn,
          insetAnimationDuration: const Duration(milliseconds: 500),
          elevation: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
