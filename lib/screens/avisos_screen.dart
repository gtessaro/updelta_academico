import 'package:flutter/material.dart';
import 'package:updelta_academico/json_samples/dados.dart';
import 'package:updelta_academico/models/Aviso.dart';
import 'package:updelta_academico/tiles/aviso_expansion_tile.dart';

class AvisosScreen extends StatelessWidget {
  List<Map<String, dynamic>> avisos = Dados.getAvisos(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: avisos.length,
        itemBuilder: (context, index){

          Aviso aviso = Aviso.fromJson(avisos[index]);

          return Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
              child: AvisoExpansionTile(aviso),
            ),
          );
        },

      ),
    );
  }

//  Widget makeListTile(){
//    return ListTile(
//      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//      leading: Container(
//        padding: EdgeInsets.only(right: 12.0),
//        decoration: new BoxDecoration(
//          border: new Border(
//            right: new BorderSide(width: 1.0, color: Colors.white24)
//          )
//        ),
//        child: Image.asset("images/logo_swa_200x1400.png",fit: BoxFit.fill,width: 75,),
//      ),
//      title: Text(
//        "Introduction to Driving",
//        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//      ),
//      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
//
//      subtitle: Row(
//        children: <Widget>[
//          Text(" Intermediate", style: TextStyle(color: Colors.black))
//        ],
//      ),
//      trailing: IconButton(
//        icon: Icon(Icons.keyboard_arrow_right),
//        color: Colors.black,
//        onPressed: (){},
//      )
//    );
//  }

}