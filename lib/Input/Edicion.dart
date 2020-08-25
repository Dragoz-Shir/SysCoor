 import 'package:flutter/material.dart';

edicion(String mostrar , Color colorcito){
  return InputDecoration(
                  labelText: '$mostrar:',
                  labelStyle: TextStyle(color: colorcito),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),                      
                      ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorcito),
                      borderRadius: BorderRadius.circular(12.0),
                      ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorcito),
                      borderRadius: BorderRadius.circular(12.0),
                      ),                  
  );
}