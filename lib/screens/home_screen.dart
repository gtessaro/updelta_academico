import 'package:flutter/material.dart';
import 'package:updelta_academico/screens/avisos_screen.dart';
import 'package:updelta_academico/screens/calendar_screen.dart';
import 'package:updelta_academico/screens/financeiro_screen.dart';
import 'package:updelta_academico/screens/notas_screen.dart';
import 'package:updelta_academico/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();
  final Color backgroundColor = Colors.green[200];

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text("Avisos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: AvisosScreen(),
          backgroundColor: backgroundColor,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Notas"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: NotasScreen(),
          backgroundColor: backgroundColor,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Calendário"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: CalendarScreen(),
          backgroundColor: backgroundColor,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Financeiro"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: FinanceiroScreen(),
          backgroundColor: backgroundColor,
        ),
      ],
    );;
  }
}
