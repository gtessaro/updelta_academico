import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:updelta_academico/json_samples/dados.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>{
  DateTime _selectedDay;
  Map<DateTime, List> _events;
  Map<DateTime, List> _visibleEvents;
  List _selectedEvents;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TableCalendar(
            locale: 'pt_BR',
            calendarStyle: CalendarStyle(
              selectedColor: Colors.lightBlue[400],
              todayColor: Colors.lightBlue[200],
              markersColor: Colors.green,
            ),
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
            ),
            availableCalendarFormats: {
              CalendarFormat.month: 'Month',
            },
            onVisibleDaysChanged: _onVisibleDaysChanged,
            onDaySelected: _onDaySelected,
            events: _visibleEvents,
            formatAnimation: FormatAnimation.slide,
          ),
          const SizedBox(height: 8.0),
          Expanded(child: _buildEventList()),
        ],
      ),

    );
  }

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    _events = _buildListaEventosFromApi();
    _selectedEvents = _events[_selectedDay] ?? [];
    _visibleEvents = _events;
  }

  void _onDaySelected(DateTime day, List events) {
    setState(() {
      _selectedDay = day;
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(DateTime first, DateTime last, CalendarFormat format) {

    setState(() {
      _visibleEvents = Map.fromEntries(
        _events.entries.where(
              (entry) =>
          entry.key.isAfter(first.subtract(const Duration(days: 1))) &&
              entry.key.isBefore(last.add(const Duration(days: 1))),
        ),
      );
    });
    _selectedEvents = [];
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents.map(
        (event) => Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.8),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: ListTile(
            title: Text(event.toString()),
            onTap: null,
          ),
        )
      ).toList(),
    );
  }

  Map<DateTime, List>  _buildListaEventosFromApi(){
    List<Map> events2 = Dados.getFeriados(0);
    Map<DateTime, List> feriados = Map();
    
    for(Map<String,dynamic> m in events2){
      if(feriados.containsKey(DateTime.parse(m["dataInicio"]))){
        List l = feriados[DateTime.parse(m["dataInicio"])];
        l.add(m["descricao"]);
        feriados[DateTime.parse(m["dataInicio"])] = l;
      }else{
        List l = List();
        l.add(m["descricao"]);
        feriados[DateTime.parse(m["dataInicio"])] = l;
      }
    }

    return feriados;
  }
}
