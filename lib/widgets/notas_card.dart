import 'package:flutter/material.dart';
import 'package:updelta_academico/screens/avaliacao_disciplina_screen.dart';

class NotasCard extends StatelessWidget {

  final String disciplina;
  final String professor;
  final String status;
  final double nota;
  final int idMatriculaDisciplina;
  final int idAluno;
  final Color cor;

  NotasCard({@required this.disciplina,
             @required this.professor,
             @required this.status,
             @required this.nota,
             @required this.idAluno,
             @required this.idMatriculaDisciplina,
             @required this.cor
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: this.cor,
      child: SizedBox(
        height: 100.0,
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AvaliacaoDisciplinaScreen(
                                                              this.idAluno,
                                                              this.idMatriculaDisciplina,
                                                              this.disciplina,
                                                              this.nota,
                                                              this.status,
                                                              this.cor
                                        )
                )
            );
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Text(
                    this.nota.toStringAsFixed(1),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        this.disciplina,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                        ),
                      ),
                      Text(
                        "Prof. ${this.professor}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          this.status,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
