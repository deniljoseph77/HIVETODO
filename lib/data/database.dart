import 'package:hive/hive.dart';


class TodoDataBase{

  List toDolist = [];


  /// reference  our bo  final _myBox = Hive.box('mybox');
  final _myBox = Hive.box("mybox");


  /// run this if this is the 1st time ever opening this app
  void createInitialData(){
    toDolist = [
      ["Do work", false],
      ["Do Excirse", false],
    ];
  }

  /// load the data from database
  void loadData(){
   toDolist = _myBox.get("TODOLIST");
  }


  /// update the database
  void updateDataBase(){
    _myBox.put("TODOLIST",toDolist );
  }
}