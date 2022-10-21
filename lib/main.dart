import 'package:flutter/material.dart';
import 'package:my_first_app_test/constants/key_constants.dart';
import 'package:my_first_app_test/screens/form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Initial Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CircleAvatar(
              key: FirstPagekeys.nextPageKey,
              radius: 30,
              backgroundColor: Colors.black45,
              child: IconButton(
                color: Colors.white,
                iconSize: 30,
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FormScreen(),
                    ),
                  )
                },
                icon: const Icon(Icons.arrow_forward_ios_outlined),
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            CircleAvatar(
              key: FirstPagekeys.incrementKey,
              radius: 30,
              backgroundColor: Colors.black45,
              child: IconButton(
                iconSize: 30,
                onPressed: () => _incrementCounter(),
                color: Colors.white,
                icon: const Icon(
                  Icons.add,
                ),
              ),
            )
          ],
        ));
  }
}
