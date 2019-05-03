import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class BoletoScreen extends StatelessWidget {

  final double valor;
  final DateTime vencimento;

  BoletoScreen(this.valor,this.vencimento);

  GlobalKey _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Boleto"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "R\$ ${valor.toStringAsFixed(2)}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 8,),
              Text(
                "Vencimento ${DateFormat("dd 'de' MMMM","pt_BR").format(this.vencimento)}",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 45,),
              Text(
                "Utilize o código de barras abaixo para realizar o pagamento.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200
                ),
              ),
              SizedBox(height: 25,),
              Text(
                "42297.11504.00001.95441142400.239622 6 73570000009647",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),
              ),
              SizedBox(height: 25,),
              Builder(
                builder: (context) => RaisedButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.content_copy),
                      Expanded(
                          child: Text(
                            "Copiar Código",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),
                          )
                      )
                    ],
                  ),
                  onPressed: (){Clipboard.setData(
                    ClipboardData(text: "42297.11504.00001.95441142400.239622 6 73570000009647"));
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Código copiado para a área de transferência!',
                          textAlign: TextAlign.center,
                        ),
                      )
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}