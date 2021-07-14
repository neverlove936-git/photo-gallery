import 'package:flutter/material.dart';
import 'app.dart';
import 'flavors.dart';

void main() {
  Env.appFlavor = Flavor.development;
  runApp(App());
}
