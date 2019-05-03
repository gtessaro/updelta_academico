import 'package:flutter/material.dart';
import 'package:updelta_academico/json_samples/dados.dart';

class AvaliacaoDisciplinaScreen extends StatelessWidget {

  final int idAluno;
  final int idMatriculaDisciplina;
  final String disciplina;
  final double notaFinal;
  final String status;
  final Color cor;

  AvaliacaoDisciplinaScreen(
      this.idAluno,
      this.idMatriculaDisciplina,
      this.disciplina,
      this.notaFinal,
      this.status,
      this.cor
  );

  List<Map> avaliacoes;

  @override
  Widget build(BuildContext context) {
    avaliacoes = Dados.getNotaDisciplina(this.idAluno, idMatriculaDisciplina);

    return Scaffold(
      appBar: AppBar(
        title: Text(disciplina),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
//        color: Color.fromARGB(100, 40, 215, 206),
        child: Column(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16.0,),
                  Text(
                    "MÉDIA FINAL",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: cor,
                    child: Text(
                      notaFinal.toStringAsFixed(1),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Text(
                    status,
                    style: TextStyle(
                      color: cor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  Text(
                    "${avaliacoes[0]["quantFaltas"].toString()} FALTAS",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16.0,),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Avaliações",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      height: 200.0,
                      child: ScrollConfiguration(
                        behavior: ScrollBehavior(),
                        child: ListView.builder(
                          itemCount: avaliacoes.length+1,
                          itemBuilder: (context,index){
                            if(index<avaliacoes.length) {
                              String avaliacao = avaliacoes[index]["avaliacao"]+" (${avaliacoes[index]["identificacao"]})";
                              String nota = avaliacoes[index]["nota_para_apresentar"].toString();
                              return Avaliacoes(avaliacao, nota);
                            }else{
                              return Avaliacoes("Frequência", avaliacoes[0]["frequencia"].toString());
                            }
                          }
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}

class Avaliacoes extends StatelessWidget {

  final String avaliacao;
  final String nota;

  Avaliacoes(this.avaliacao,this.nota);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Text(
            avaliacao,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  nota,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
