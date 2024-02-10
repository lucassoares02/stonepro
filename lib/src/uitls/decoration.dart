import 'package:flutter/material.dart';
import 'package:stonepro/src/uitls/spacing.dart';

InputDecoration inputDecorationEnabled({String? labelText}) {
  return InputDecoration(
    filled: true,
    contentPadding: const EdgeInsets.all(appPadding),
    focusColor: Colors.grey[50],
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(appRadius),
      ),
    ),
    fillColor: Colors.grey.withOpacity(0.1),
    hintText: labelText ?? "...",
  );
}

InputDecoration inputDecorationDisabled({String? labelText}) {
  return InputDecoration(
    filled: true,
    contentPadding: const EdgeInsets.all(appPadding),
    focusColor: Colors.transparent,
    border: const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(
        Radius.circular(appRadius),
      ),
    ),
    hintText: labelText ?? "...",
  );
}

ButtonStyle buttonStyle({Color? color}) {
  return ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(color),
    elevation: const MaterialStatePropertyAll(0),
    minimumSize: const MaterialStatePropertyAll(Size(70, 50)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(appRadius),
        side: BorderSide.none,
      ),
    ),
  );
}
