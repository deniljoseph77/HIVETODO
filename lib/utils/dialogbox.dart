import 'package:flutter/material.dart';
import 'package:todolist1/utils/my_button.dart';

class DialogBox extends StatelessWidget {
   DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow.shade300,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: "Save", onPressed:onSave),
                const SizedBox(
                  height: 10,
                  width: 60,
                ),
                MyButton(text: "cancel", onPressed:onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
