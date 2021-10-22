// Scope
// Contains map of state
// read
// root widget of project

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod/provider.dart';

class Scope extends InheritedWidget {
  Scope({Key? key, required Widget child})
      : super(key: key, child: child);

  final Map<Provider, ChangeNotifier> globalState = {};
  final Map<Provider,Set<Provider>> watched = {};

  ChangeNotifier read(Provider provider) {
    return globalState.putIfAbsent(provider, () => provider.create()..addListener(provider.notify));
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}