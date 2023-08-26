import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.user});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final User user;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _highscore = 0;
  bool _playing = false;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _updateHighscore() async {
    await _db.collection("users").doc(widget.user.uid).get().then((event) {
      if (event.data() != null) {
        // set highscore field
        setState(() {
          _highscore = event.data()!["highscore"];
        });
      }
    });
  }

  void _stopPlaying() async {
    setState(() {
      _playing = false;
    });
    AlertDialog gameOverAlert = AlertDialog(
      title: const Text("Game Over"),
      content: Text('Nice job! You scored $_counter!'),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return gameOverAlert;
      },
    );
    await _db.collection("users").doc(widget.user.uid).get().then((event) {
      if (event.data() == null || event.data()!["highscore"] < _counter) {
        // set new highscore
        _db.collection("users").doc(widget.user.uid).set({
          "highscore": _counter,
        });
      }
    });
    _updateHighscore();
  }

  void _startPlaying() {
    setState(() {
      _counter = 0;
      _playing = true;
    });
    Timer(
      const Duration(seconds: 5),
      _stopPlaying,
    );
  }

  @override
  void initState() {
    super.initState();
    _updateHighscore();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    Widget fab;
    if (_playing) {
      fab = FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      );
    } else {
      fab = FloatingActionButton(
        onPressed: _startPlaying,
        tooltip: 'Start!',
        child: const Icon(Icons.play_arrow),
      );
    }
    List<Widget> mainText;
    if (_playing) {
      mainText = <Widget>[
        const Text(
          'You have clicked the button this many times:',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ];
    } else {
      mainText = <Widget>[
        const Text(
          'Click the play button to start playing!',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          'Your highscore: $_highscore',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 30),
        const SignOutButton(),
      ];
    }

    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.primary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: mainText,
        ),
      ),
      floatingActionButton:
          fab, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
