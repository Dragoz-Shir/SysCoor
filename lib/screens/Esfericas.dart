import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:cantinera/Input/Edicion.dart';
import 'package:flutter/material.dart';
 double equis = 0.0, ye = 0.0, zeta = 0.0;
  double teta = 0.0, r = 0.0, otro = 0.0;
class Esfericas extends StatefulWidget {
  @override
  _EsfericasState createState() => _EsfericasState();
}

class _EsfericasState extends State<Esfericas> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Esféricas'),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
        child: Column(
          children: <Widget>[
            TextField(
              decoration:edicion('ρ', Colors.deepOrange),
              cursorColor: Colors.deepOrange,
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
              decoration: edicion('θ', Colors.deepOrange),
              cursorColor: Colors.deepOrange,
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
              decoration: edicion('φ', Colors.deepOrange),
              cursorColor: Colors.deepOrange,
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
                        double yeR, zetaR;

                        yeR = ye * (pi / 180);
                        zetaR = zeta * (pi / 180);

                        double priV = (equis) * (sin(yeR) * cos(zetaR));
                        String pv = priV.toStringAsFixed(5);
                        double segV = equis * (sin(yeR) * sin(zetaR));
                        String sV = segV.toStringAsFixed(5);

                        double terV = equis * cos(yeR);
                        String tV = terV.toStringAsFixed(5);

                        /* Cilindricas*/

                        double rE, zetaE;
                        rE = equis * (sin(yeR));
                        String tetaE = rE.toStringAsFixed(5);
                        zetaE = equis * (cos(yeR));
                        String ultimo = zetaE.toStringAsFixed(5);

                        AlertDialog dialogo = new AlertDialog(
                          content: Container(
                            height: 200,
                            child: Column(
                              children: <Widget>[
                                Divider(
                                  color: Colors.deepOrange,
                                  thickness: 5.0,
                                ),
                                Text('Cartesianas'),
                                Text('X: $pv'),
                                Text('Y: $sV'),
                                Text('Z: $ultimo'),
                                Divider(
                                  color: Colors.deepOrange,
                                  thickness: 5.0,
                                ),
                                Text('Cilindricas'),
                                Text('r: $tetaE'),
                                Text('φ: $zeta'),
                                Text('Z: $tV'),
                                Divider(
                                  color: Colors.deepOrange,
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
                      color: Colors.deepOrange,
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
      )),
    );
  }
}
