import 'package:flutter/material.dart';
import 'package:updelta_academico/json_samples/dados.dart';
import 'package:updelta_academico/widgets/notas_card.dart';

class NotasScreen extends StatelessWidget {

  List<Map> notas = Dados.getNotas(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView.builder(
          itemCount: notas.length,
          itemBuilder: (context,index){
            String stColor = notas[index]["statusCor"];
            var colors = stColor.split(',');
            int colorR = int.parse(colors[0]);
            int colorG = int.parse(colors[1]);
            int colorB = int.parse(colors[2]);

            return NotasCard(
              disciplina: notas[index]["disciplina"],
              professor: notas[index]["professor"],
              status: notas[index]["statusLegivel"],
              nota: notas[index]["notaFinal"],
              idAluno: 0,
              idMatriculaDisciplina: notas[index]["idMatriculaDisciplina"],
              cor: Color.fromARGB(255, colorR, colorG, colorB),
            );
          }
      ),
    );
  }
}
