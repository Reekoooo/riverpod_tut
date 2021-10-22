// Consumer
// widget rebuild when state change
// watch function return state and listen on Provider

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod/provider.dart';
import 'package:riverpod/riverpod/scope.dart';

typedef Watch = ChangeNotifier Function(Provider provider);
typedef ConsumerBuilder = Widget Function(Watch watch);

class Consumer extends StatefulWidget {
  const Consumer({Key? key, required this.builder}) : super(key: key);

  final ConsumerBuilder builder;

  @override
  _ConsumerState createState() => _ConsumerState();
}

class _ConsumerState extends State<Consumer> {
  final Set<Provider> _watched = {};

  ChangeNotifier watch(Provider provider) {
    final state =
    context.dependOnInheritedWidgetOfExactType<Scope>()!.read(provider);
    if (!_watched.contains(provider)) {
      _watched.add(provider);
      provider.addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
    }
    return state;
  }

  void rebuildTree(Element element){
    element.markNeedsBuild();
    element.visitChildren(rebuildTree);
  }

  @override
  Widget build(BuildContext context) {
    (context as Element).visitChildren(rebuildTree);
    return widget.builder(watch);
  }
}
