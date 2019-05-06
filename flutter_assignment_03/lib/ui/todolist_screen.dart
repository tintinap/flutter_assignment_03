import 'package:flutter/material.dart';
import 'package:flutter_assignment_03/ui/todo.dart';
import 'package:flutter_assignment_03/ui/completed_content.dart';


import '../firestore.dart';

class TodoListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoState();
  }
}

class TodoState extends State {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      Todo(),
      Complete()
    ];

    final List topBar = <Widget>[
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addTask');
        },
      ),
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          FirestoreUtils.deleteAllCompleted();
        },
      )
    ];

    return new Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        actions: <Widget>[topBar[_index]],
      ),
      body: Center(child: _children[_index]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Task')),
          BottomNavigationBarItem(
              icon: Icon(Icons.done_all), title: Text("Completed"))
        ],
        onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}