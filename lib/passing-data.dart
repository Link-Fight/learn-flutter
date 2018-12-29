import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

final todos = List<Todo>.generate(
    20,
    (i) =>
        Todo('Todo $i', 'A description of what needs to be done for todo $i'));

// ListView.Builder(
//  itemBuilder: (context, index) {
//     return ListTile(
//       title: Text(todos[index].title),
//     );
//   },
// );

class DetailScreen extends StatelessWidget {
  final Todo todo;
  DetailScreen({Key key, @required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${todo.title}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('${todo.description}'),
      ),
    );
  }
}
