
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod/provider.dart';
import 'package:riverpod/riverpod/scope.dart';

extension Read on BuildContext{
  ChangeNotifier read(Provider provider){
    return dependOnInheritedWidgetOfExactType<Scope>()!.read(provider);
  }
}