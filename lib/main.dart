import 'package:flutter/material.dart';
import 'package:trying_sqlite/model/User.dart';
import 'package:trying_sqlite/screens/addUser.dart';
import 'package:trying_sqlite/services/userService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<User> _userList;
  final _userService = UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CRUD using SQLite"),),
      body: Center(child: Text("Aplikasi CRUD Pendataan Barang dengan SQLite"),),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, 
          MaterialPageRoute(builder: (context) => AddUser())
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
