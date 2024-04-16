import 'package:flutter/material.dart';

class HomeScreenview extends StatefulWidget {
  const HomeScreenview({super.key});

  @override
  State<HomeScreenview> createState() => _HomeScreenviewState();
}

class _HomeScreenviewState extends State<HomeScreenview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        elevation: 5,
        title: Text("To do List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNote(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

Future<dynamic> addNote(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(border: OutlineInputBorder(),
                       hintText: "add notes"),
                ),
                SizedBox(height: 15,),
                TextField(decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "add notes"),),
                ElevatedButton(onPressed: (){}, child: Text("Add"))
              ],
            ),
          ),
        );
      });
}
