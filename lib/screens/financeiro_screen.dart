import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:updelta_academico/json_samples/dados.dart';
import 'package:updelta_academico/screens/boleto_screen.dart';

class FinanceiroScreen extends StatelessWidget {

  List<Map> transacoes = Dados.getFinanceiro(0);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.lightGreen[300],
          title: TabBar(
            tabs: [
              Tab(text: "Em Aberto",),
              Tab(text: "Todas"),
            ],
          ),
        ),
        backgroundColor: Colors.green[200],
        body: TabBarView(
          children: [
            _buildListView(true,context),
            _buildListView(false,context),
          ],
        ),
      ),
    );
  }

  Widget _buildListView(bool isAbertos,BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: transacoes.where(
          (t){
            if(isAbertos){
              if(t["situacao"] == "ABERTO"){
                return true;
              }else{
                return false;
              }
            }
            return true;
          }
        ).map(
        (t) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: t["situacao"]=="PAGO"?Colors.green[800]:Colors.yellow[300],
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: InkWell(
              onTap: t["situacao"]!="ABERTO"?null: (){
                //Se não liberado web mostrar mensagem...
                print(t["_boletoLiberadoWeb"]);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context){
                      return BoletoScreen(t["valor"].toDouble(),DateTime.parse(t["dataVencimento"]));
                    }
                  )
                );
              },
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          DateFormat("MMMM y","pt_BR").format(DateTime.parse(t["dataVencimento"])),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12,),
                        Text("Vencimento: ${DateFormat("dd/MM/y","pt_BR").format(DateTime.parse(t["dataVencimento"]))}"),
                        Text("Valor: ${t["valor"].toStringAsFixed(2)} reais"),
                        SizedBox(height: 8,)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment(0.7, 0.5),
                      child: Text(
                        t["situacao"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          )
        ).toList(),
      ),
    );
  }
}
