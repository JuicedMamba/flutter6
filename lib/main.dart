import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

void main() {
  runApp(MyApp()); // Use `MyApp` instead of `MainApp`
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Counter(),
      child: MaterialApp(
        title: 'Counter App',
        home: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<Counter>(
              builder: (context, counter, _) {
                return Text(
                  'Count: ${counter.count}',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () =>
                  Provider.of<Counter>(context, listen: false).increment(),
              child: Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Provider.of<Counter>(context, listen: false).decrement(),
              child: Text('Decrement'),
            ),
          ],
        ),
      ),
    );
  }
}
