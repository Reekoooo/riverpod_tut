import 'package:flutter/material.dart';
import 'package:riverpod/riverpod/riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scope(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (watch) => Text(
                '${(watch(counter) as Counter).count}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
              child: const Text('Second Screen'),
              onPressed: ()=>Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>const SecondScreen())
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (context.read(counter) as Counter)
            .incrementCount,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Second Screen'),
      ),
      body: Center(
         child:  Consumer(builder: (watch) => Text('${(watch(counter) as Counter).count}',
         style: const TextStyle(fontSize: 50.0),)),
      ),
    );
  }
}

final counter = Provider(() => Counter());

class Counter extends ChangeNotifier {
  int count = 0;

  void incrementCount() {
    count++;
    notifyListeners();
  }
}



