import 'package:flutter/material.dart';
import 'package:cantinera/screens/cartesianas.dart';
import 'package:cantinera/screens/cilindricas.dart';
import 'package:cantinera/screens/esfericas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Fondo(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Fondo extends StatefulWidget {
  @override
  _FondoState createState() => _FondoState();
}

class _FondoState extends State<Fondo> {
  int _cualesta = 0;
  final List<Widget> _children = [Cartesianas(), Cilindricas(), Esfericas()];

  void accionPantallas(int puntero) {
    setState(() {
      _cualesta = puntero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_cualesta],
      bottomNavigationBar: BottomNavigationBar(
        onTap: accionPantallas,
        currentIndex: _cualesta,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.control_point),
            title: Text('Cartesianas'),
            backgroundColor: Colors.teal,
            activeIcon: Icon(
              Icons.control_point,
              color: Colors.teal,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.panorama_wide_angle),
            title: Text('Cilíndricas'),
            activeIcon: Icon(
              Icons.panorama_wide_angle,
              color: Colors.amber,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            title: Text('Esféricas'),
            activeIcon: Icon(
              Icons.language,
              color: Colors.deepOrange,
            ),
          )
        ],
      ),
    );
  }
}
