import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/widgets/addTodo.dart';
import 'package:todo_app/widgets/todo_list.dart';
import 'package:url_launcher/url_launcher.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> todoList = [];
  // here the value of to do is changing
  void addTodo({required todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
          context: context,
          builder: (context) {
            // This is a alreat dialogue
            return AlertDialog(
              title: Text("Already Exist"),
              content: Text("This TODO data already exists."),
              // REndering in the content in botton right
              actions: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("Close")),
              ],
            );
          });
      return;
    }
    setState(() {
      todoList.insert(0, todoText);
    });
    // This update locat will be called and to list will be saved

    updateLocalData();
    Navigator.pop(context);
  }

  // Here we are using the shared preferences to load and save data locally
  void updateLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

// Save an list of strings to 'items' key.
    await prefs.setStringList('todoList', todoList);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Retriving the data and then converting that data into dart compactible list

    setState(() {
      todoList = (prefs.getStringList("todoList") ?? []).toList();
    });
// Save an list of strings to 'items' key.
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void addTasks() {
    showModalBottomSheet(
        //backgroundColor: Colors.red[100],
        context: context,
        builder: (context) {
          return Padding(
            // WE are using media querry here to not hide our bottom sheet

            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: EdgeInsets.all(20),
              height: 200,
              child: Addtodo(
                addTodo: addTodo,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey[900],
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  "To-Do",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                launchUrl(Uri.parse("www.google.com"));
              },
              leading: Icon(Icons.person),
              title: Text(
                "About me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              onTap: () {
                launchUrl(Uri.parse("mailto:szaid5146@gmail.com"));
              },
              leading: Icon(Icons.email),
              title: Text(
                "Contact me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('To-Do'),
        actions: [
          InkWell(
            splashColor: Colors.green[100],
            //highlight color
            //enableFeedback: false
            onTap: addTasks,
            // THis is the bottom sheet

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.add,
              ),
            ),
          )
        ],
      ),
      //seggregating
      body:
          TodoListBuilder(todoList: todoList, updateLocalData: updateLocalData),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: addTasks,
        backgroundColor: Colors.blueGrey[900],
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        
      ),
    );
  }
}
