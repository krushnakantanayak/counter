import 'package:counter/services/auth_service.dart';
import 'package:counter/services/database_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  void _loadCounter() async {
    int savedCounter = await DatabaseService.getUserCounter(widget.username);
    setState(() {
      counter = savedCounter;
    });
  }

  void _incrementCounter() async {
    setState(() {
      counter++;
    });
    await DatabaseService.updateUserCounter(widget.username, counter);
  }

  void _logout() async {
    await AuthService.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => HomePage(username: widget.username)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter - ${widget.username}"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: $counter', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            FloatingActionButton(
              onPressed: _incrementCounter,
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
