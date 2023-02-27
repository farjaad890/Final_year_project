import 'package:flutter/material.dart';
import 'dart:core';
import 'package:navigation/models/products.dart';
import 'package:navigation/screens/floorscreen2.dart';
import 'package:navigation/screens/home.dart';
import '../models/global.dart';
import '../models/person.dart';

class priority extends StatefulWidget {
  final List<product> items;
  final int total;
  const priority({Key? key, required this.items, required this.total}) : super(key: key);
  @override
  State<priority> createState() => _priorityState();
}

class _priorityState extends State<priority> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Priority list"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: widget.items.length,
          itemBuilder: ( BuildContext context, int index){
            return Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.items[index].name),
                  Spacer(),
                  Container(
                    height: 30,
                    width: 70,
                    child: TextField(
                      controller: widget.items[index].priority_getter,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items:
      <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.save),
          label: 'Save',
          backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.navigation),
          label: 'Navigate',
          backgroundColor: Colors.green,
        ),
      ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
