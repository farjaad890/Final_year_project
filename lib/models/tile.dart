import 'package:flutter/material.dart';
import 'package:navigation/screens/shelf.dart';






// class Tile extends StatefulWidget {
//     final Color color;
//    late int? id=0 ;
//    Tile({Key? key, required this.color,this.id}) : super(key: key);
//
//   @override
//   State<Tile> createState() => _TileState();
// }
//
// class _TileState extends State<Tile> {
//   late int? id=widget.id;
//   late Color color=widget.color;
//   sayhello(){
//     if(id==0){
//       print("This is the way");
//     }
//     else{
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => shelf(id: id,)),
//       );
//     }
//     print(id.toString());
//   }
//   @override
//   Widget build(BuildContext context) {
//         if(id==null)
//       {
//         id= 0;
//       }
//     return GestureDetector(
//       onTap: sayhello,
//       child: Container(
//         child: Center(
//           child:
//           Text(id.toString()),
//         ),
//         width: 30,
//         height: 31,
//         color: color,
//       ),
//     );
//   }
// }


class Tile extends StatelessWidget {
  final Color color;
   late int? id=0 ;
   Tile({Key? key,required this.color,this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    sayhello(){
      if(id==null)
      {

      }
      else{
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>shelf(id: id,),)
        );
      }
      print(id.toString());
    }

    return GestureDetector(
      onTap: sayhello,
      child: Container(
        child:
        Center(
          child: (id==null) ? Text(" "):
          Text(id.toString()),
        ),
        width: 30,
        height: 31,
        color: color,
      ),
    );
  }
}
