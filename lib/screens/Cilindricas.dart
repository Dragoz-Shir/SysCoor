import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cantinera/Input/Edicion.dart';
import 'package:flutter/material.dart';

double equis = 0.0, ye = 0.0, zeta = 0.0;
double teta = 0.0, r = 0.0, otro = 0.0;

class Cilindricas extends StatefulWidget {
  @override
  _CilindricasState createState() => _CilindricasState();
}

class _CilindricasState extends State<Cilindricas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Cilíndricas'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: edicion('r', Colors.amber),
                cursorColor: Colors.amber,
                onChanged: (entrada) {
                  try {
                    equis = double.parse(entrada);
                  } catch (e) {
                    print(e);
                  }
                },
                keyboardType: TextInputType.number,
              ),
              Divider(
                color: Colors.white,
              ),
              TextField(
                decoration: edicion('φ', Colors.amber),
                cursorColor: Colors.amber,
                onChanged: (entrada) {
                  try {
                    ye = double.parse(entrada);
                  } catch (e) {
                    print(e);
                  }
                },
                keyboardType: TextInputType.number,
              ),
              Divider(
                color: Colors.white,
              ),
              TextField(
                decoration: edicion('Z', Colors.amber),
                cursorColor: Colors.amber,
                onChanged: (entrada) {
                  try {
                    zeta = double.parse(entrada);
                  } catch (e) {
                    print(e);
                  }
                },
                keyboardType: TextInputType.number,
              ),
              Container(
              
                child: Column(
                  children: <Widget>[
                    BounceInDown(
                      child: IconButton(
                        onPressed: () {
                          /*Cartesianas*/
                          double yeRad = ye * (pi / 180);
                          double primerValor = equis * (cos(yeRad));
                          String pV = primerValor.toStringAsFixed(5);

                          double segundoValor = equis * (sin(yeRad));
                          String sV = segundoValor.toStringAsFixed(5);

                          /*Esfericas */
                          double tercerValor =
                              sqrt((equis * equis) + (zeta * zeta));
                          String pVE = tercerValor.toStringAsFixed(5);

                          double superDivision =
                              1 / (sqrt((equis * equis) + (zeta * zeta)));
                          double svAlgo = (acos(superDivision)) * (180 / pi);
                          String svE = svAlgo.toStringAsFixed(5);

                          AlertDialog dialogo = new AlertDialog(
                            content: Container(
                              height: 200,
                              child: Column(
                                children: <Widget>[
                                  Divider(
                                    color: Colors.amber,
                                    thickness: 5.0,
                                  ),
                                  Text('Cartesianas'),
                                  Text('X: $pV'),
                                  Text('Y: $sV'),
                                  Text('Z: $zeta'),
                                  Divider(
                                    color: Colors.amber,
                                    thickness: 5.0,
                                  ),
                                  Text('Esfericas'),
                                  Text('ρ: $pVE'),
                                  Text('θ: $svE'),
                                  Text('φ: $ye'),
                                  Divider(
                                    color: Colors.amber,
                                    thickness: 5.0,
                                  )
                                ],
                              ),
                            ),
                            elevation: 25.0,
                          );
                          showDialog(context: context, child: dialogo);
                        },
                        icon: Icon(Icons.gesture),
                        color: Colors.amber,
                        iconSize: 50.0,
                        tooltip: 'Pusha aquí para ver magia',
                      ),
                    ),
                    BounceInUp(child: Text('Magic!'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
