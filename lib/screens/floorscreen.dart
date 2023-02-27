import 'package:flutter/material.dart';
import '../models/tile.dart';
import '../models/tiles.dart';
import '../models/products.dart';

class Floor extends StatefulWidget {
  final int title;
  final List<product> ind;
  const Floor({Key? key, required this.title, required this.ind}) : super(key: key);
  @override
  State<Floor> createState() => _FloorState();
}

class _FloorState extends State<Floor> {
  late List<product> products= widget.ind;
  void _onNavigation() {
    int index;
    setState(() {
      for(int i=0;i<products.length;i++)
        {
          print("this is working");
          index= products[i].position;
          tiles[index]=Tile(color:Colors.black,id: index,);
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title.toString()),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            ListView.builder(
              shrinkWrap: true,
              itemCount:Floorplan.length,
              itemBuilder:(BuildContext context,int index){
                return Floorplan[index];
              },
            ),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onNavigation,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
