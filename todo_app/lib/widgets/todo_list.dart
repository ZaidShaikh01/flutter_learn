import 'package:flutter/material.dart';

class TodoListBuilder extends StatefulWidget {
  List<String> todoList;
  void Function() updateLocalData;
  TodoListBuilder(
      {super.key, required this.todoList, required this.updateLocalData});

  @override
  State<TodoListBuilder> createState() => _TodoListBuilderState();
}

class _TodoListBuilderState extends State<TodoListBuilder> {
  // This function gets triggered when an item is clicked
  void onItemClicked({required int index}) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    // Here we are removing the value at the index
                    setState(() {
                      widget.todoList.removeAt(index);
                    });
                    widget.updateLocalData();
                    Navigator.pop(context);
                  },
                  child: Text("Mark as Done")));
        });
  }

  @override
  Widget build(BuildContext context) {
    return (widget.todoList.isEmpty)
        ? Center(child: Text("Add your first task"))
        : ListView.builder(
            itemCount: widget.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                direction: DismissDirection.startToEnd,
                // secondaryBackground: Container(
                //   color: Colors.red[900],
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //     Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Icon(Icons.delete),
                //     )
                //   ]),
                // ),
                // Initially it just remove the widgets on screen by Swapping
                background: Container(
                  color: Colors.green[400],
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.check),
                    )
                  ]),
                ),
                onDismissed: (direction) {
                  setState(() {
                    widget.todoList.removeAt(index);
                  });
                  widget.updateLocalData();
                },
                key: UniqueKey(),
                child: ListTile(
                  onTap: () {
                    // THis will call the function and pass the element
                    onItemClicked(index: index);
                  },
                  title: Text(widget.todoList[index]),
                  //leading: Icon(Icons.arrow_back),
                  //trailing: Icon(Icons.arrow_back_ios),
                ),
              );
            });
  }
}
