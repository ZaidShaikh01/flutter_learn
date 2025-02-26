import 'package:flutter/material.dart';

class Addtodo extends StatefulWidget {
  // Adding this so that we are communicating between parent and child

  void Function({required String todoText}) addTodo;

  Addtodo({super.key, required this.addTodo});

  @override
  State<Addtodo> createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  TextEditingController todoText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add todo:  "),
        TextField(
          onSubmitted: (value) {
            if (todoText.text != "") {
              widget.addTodo(todoText: todoText.text);
            }
            todoText.text = '';
          },
          autofocus: true,
          controller: todoText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10),
            hintText: "Write your todo....",
            //labelText: 'Username',
            //icon: Icon(Icons.add)),
            //style: TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              // Here we are passing the todo text to the parent class
              // Here the funciton will be called
              if (todoText.text != "") {
                widget.addTodo(todoText: todoText.text);
              }
              todoText.text = '';
            },
            child: Text("Save"))
      ],
    );
  }
}
