import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/provider.dart';
import 'package:flutter_advanced_networkimage/transition.dart';
import 'package:flutter_advanced_networkimage/zoomable.dart';
import 'package:updelta_academico/tiles/drawer_tile.dart';


class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  Widget _buildDrawerBack() => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 203, 236, 170),
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        )
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Image.asset("images/logo_updelta.png"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 35,
//                          backgroundImage: NetworkImage(
//                            "https://lh3.googleusercontent.com/a-/AAuE7mAxlqUsXzbxGYpFpNmuc6eFP_XMfK3WlA5ddTYuaw=s96",
//                          ),
                          backgroundImage: AdvancedNetworkImage(
                            "https://i.ytimg.com/vi/SfLV8hD7zX4/maxresdefault.jpg",
                            cacheRule: CacheRule(maxAge: const Duration(days: 7)),
                          ),
                        ),
                        SizedBox(height: 25,),
                        Text(
                          "João da Silva",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue[900]
                          ),
                        ),
                        Text(
                          "RA: 1478523",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue[900]
                          ),
                        ),
                      ],
                    )
                  ],
                ),
//                decoration: new BoxDecoration(
//                    color: Theme.of(context).primaryColor
//                ),
              ),
              DrawerTile(Icons.info,"Avisos",pageController,0),
              DrawerTile(Icons.view_list,"Notas",pageController,1),
              DrawerTile(Icons.calendar_today,"Calendário",pageController,2),
              DrawerTile(Icons.attach_money,"Financeiro",pageController,3),
            ],
          ),
        ],
      ),
    );
  }
}
