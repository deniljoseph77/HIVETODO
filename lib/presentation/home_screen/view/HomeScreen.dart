import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist1/data/database.dart';
import 'package:todolist1/utils/ToDoTile.dart';
import 'package:todolist1/utils/dialogbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  ///refernce hive box
  final _myBox =Hive.box('mybox');
  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    /// if this  is the first time ever openin the app,then create default data
    if(_myBox.get("TODOLIST")== null){
      db.createInitialData();
    }else{
      /// there already exist data
      db.loadData();

    }


    super.initState();
  }


  // /// list of to do task
  // List toDolist = [
  //   ["Do work", false],
  //   ["Do Excirse", false],
  // ];

  ///checkbox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = ! db.toDolist[index][1];
    });
    db.updateDataBase();
  }

  ///save new task
  void saveNewtask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  ///create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewtask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  ///delete task
  void deleteTask(int index){
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade200,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text("To DO"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: createNewTask,
        child: Icon(Icons.add,color: Colors.black,),
      ),
      body: ListView.builder(
        itemCount:  db.toDolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              taskName:  db.toDolist[index][0],
              taskCompleted:  db.toDolist[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),);
        },
      ),
    );
  }
}
