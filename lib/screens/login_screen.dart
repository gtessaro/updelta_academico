import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:updelta_academico/screens/home_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();
  var _infoText = "";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/logo_updelta.png",
                  fit: BoxFit.fill,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Insira seu login",
                              labelText: "Login",
                              labelStyle: TextStyle(color: Colors.lightBlueAccent),
                              alignLabelWithHint: true,
                              border: OutlineInputBorder()
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0),
                          controller: _loginController,
                          validator: (value){
                            if(value.isEmpty){
                              return "Favor informar o seu login!";
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: TextFormField(
                          obscureText: true, // Use secure text for passwords.
                          decoration: InputDecoration(
                              hintText: "Insira sua senha",
                              labelText: "Senha",
                              labelStyle: TextStyle(color: Colors.lightBlueAccent),
                              alignLabelWithHint: true,
                              border: OutlineInputBorder()
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.lightBlueAccent, fontSize: 25.0),
                          controller: _senhaController,
                          validator: (value){
                            if(value.isEmpty){
                              return "Favor informar a sua senha!";
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                        child: Container(
                          height: 50,
                          child: RaisedButton(
                            onPressed:(){
//                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 500),
                                  alignment: Alignment.center,
                                  child: HomeScreen()
                                )
                              );
                            },
                            child: Text("Entrar",
                              style: TextStyle(color: Colors.white,fontSize: 25),),
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
                Text(
                  "$_infoText",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red, fontSize: 25.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
