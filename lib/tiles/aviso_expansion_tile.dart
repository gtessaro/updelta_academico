import 'package:flutter/material.dart';
import 'package:updelta_academico/models/Aviso.dart';

class AvisoExpansionTile extends StatelessWidget {

  final Aviso aviso;

  AvisoExpansionTile(this.aviso);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: <Widget>[
          Container(
            height: 55,
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24)
              )
            ),
            child: aviso.image==null?
                    Image.asset("images/logo_updelta.png",fit: BoxFit.fill,)
                    :
                    Image.network(aviso.image,fit: BoxFit.scaleDown,width: 75,)
          ),
          Expanded(
            child: Text(
              aviso.title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20
              )
            ),
          )
        ],
      ),
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top:5.0, left: 10.0, right:10.0, bottom: 5.0),
          decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(  Radius.circular(5.0) ),
          ),
          child: aviso.body!=null?Text(aviso.body):Text(""),
        ),
      ],
    );
  }
}
