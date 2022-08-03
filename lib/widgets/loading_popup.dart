import 'dart:js';

import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

void loadingPopUp() {
  Grock.dialog(builder: (_) {
    return const Center(child: CircularProgressIndicator());
  });
}
