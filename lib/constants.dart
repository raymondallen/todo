import 'dart:ui';

import 'package:flutter/material.dart';

const kAppTitle = TextStyle(
  color: Colors.white,
  fontSize: 36.0,
  fontWeight: FontWeight.bold,
);

const kTaskCountStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
  color: Colors.white,
);

const kTaskIncompleteStyle = TextStyle(
  fontSize: 14.0,
  color: Colors.black,
);

const kTaskCompleteStyle = TextStyle(
  fontSize: 14.0,
  color: Colors.black,
  decoration: TextDecoration.lineThrough,
);

const kAddTaskTextFieldDecoration = InputDecoration(
  hintText: '',
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.deepOrange,
    ),
  ),
  errorBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.deepOrange,
    ),
  ),
  errorStyle: TextStyle(
    color: Colors.deepOrange,
  ),
  focusedErrorBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.deepOrange,
    ),
  ),
);
