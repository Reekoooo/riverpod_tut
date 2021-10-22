// Provider
// Listenable
// Know how to create state

import 'package:flutter/material.dart';


typedef Create = ChangeNotifier Function();

class Provider with ChangeNotifier {
  final Create create;

  Provider(this.create);

  notify(){
    notifyListeners();
  }
}