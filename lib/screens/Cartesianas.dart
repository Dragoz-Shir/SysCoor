import 'package:animate_do/animate_do.dart';
import 'package:cantinera/Input/Edicion.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Cartesianas extends StatefulWidget {

  @override
  _CartesianasState createState() => _CartesianasState();
}

class _CartesianasState extends State<Cartesianas> {
  double equis = 0.0, ye = 0.0, zeta = 0.0;
  double teta = 0.0, r = 0.0, otro = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Cartesianas'),
          centerTitle: true,
          backgroundColor: Colors.teal,
          ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: edicion('x', Colors.teal),
                cursorColor: Colors.teal,
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
                decoration: edicion('Y',Colors.teal),
                cursorColor: Colors.teal,
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
                decoration: edicion('Z',Colors.teal),
                onChanged: (entrada) {
                  try {
                    zeta = double.parse(entrada);
                  } catch (e) {
                    print(e);
                  }
                },
                cursorColor: Colors.teal,
                keyboardType: TextInputType.number,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    BounceInDown(
                      child: IconButton(
                        onPressed: () {
                          //Cilindricas
                          double equisC,yeC;
                          equisC=equis*equis;
                          yeC=ye*ye;
                          double r = sqrt(equisC+yeC);
                          String rR=r.toStringAsFixed(5);

                          teta=atan(ye/equis);
                          String tetaC=teta.toStringAsFixed(5);
                          double otroTeta = teta * (180 / pi);
                          String tetaGradosC = otroTeta.toStringAsFixed(5);
                          String otroC= zeta.toStringAsFixed(5);



                          ////Esfericas
                          double r2 =sqrt((equis*equis)+(ye*ye)+(zeta*zeta));
                          String r2c = r2.toStringAsFixed(5);
                          double teta2 = acos(zeta/r2);
                          String teta2c= teta2.toStringAsFixed(5);
                          double teta2grados =  teta2 * (180 / pi);
                          String teta2gradosc = teta2grados.toStringAsFixed(5);
                          double otro2 = teta * (180 / pi);
                          String otro2c = otro2.toStringAsFixed(5);
                        
                          AlertDialog dialogo = new AlertDialog(
                            content: Container(
                              height: 250,
                              child: Column(
                                children: <Widget>[
                                  Divider(
                                    color: Colors.teal,
                                    thickness: 5.0,
                                  ),
                                  Text('Cilindricas'),
                                  Text('r = $rR'),
                                  Text('φ = $tetaC Rad'),
                                  Text('φ= $tetaGradosC °'),
                                  Text('Z = $otroC'),
                                  Divider(
                                    color: Colors.teal,
                                    thickness: 5.0,
                                  ),
                                  Text('Esfericas'),
                                  Text('ρ = $r2c'),
                                  Text('θ = $teta2c Rad'),
                                  Text('θ = $teta2gradosc °'),
                                  Text('φ = $otro2c'),
                                  Divider(
                                    color: Colors.teal,
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
                        color: Colors.teal,
                        iconSize: 50.0,
                        tooltip: 'Pusha aquí para ver magia',
                      ),
                    ),
                    BounceInUp(child: Text('Magic!')),
                  ],
                ),
              ),
            ],
          ),
        )
        )
        );
  }
}
