import 'dart:ffi';

import 'package:flutter/material.dart';
import 'Principal.dart';
import 'SQL/db.dart';
import 'maps.dart';
BuildContext? contexto;
class Detalles extends StatelessWidget {
  const Detalles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    contexto = context;
    return Scaffold(
      drawer: drawerP(),
      appBar: AppBar(
        title: const Text('Gasolinera puma'),
        backgroundColor: Colors.transparent,
        elevation: 5,
      ),
      body: backgroundD(),
    );
  }
}
Widget backgroundD() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/fondo.jpg'),
        fit: BoxFit.cover,
        colorFilter:
        ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
      ),
    ),
    child: Center(
      child:ListView(

        children:[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children:[
              Container(
                //margin
                margin: const EdgeInsets.only(bottom:25),
              ),
              Decoration("Nejapa",3.86,3.95,4.50),
            ],
          ),
        ],
      ),

    ),
  );
}

Widget Decoration(String Nombre, double Precio,double Precio2, double Precio3){
  return Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children:[

      Container(
        //box redondeada
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Column(
            children:[
              Text(
                "$Nombre", style:TextStyle(fontSize:25,color:Colors.black),
              ),

              Image.asset(
                "assets/gaso.png",
                height: 100,
                width: 100,

              ),
              Column(
                children:[
                  //listview
                  Text("REGULAR", style:TextStyle(fontSize:20,color:Colors.black)),
                  Image.asset(
                    "assets/gas.png",
                    height: 110,
                    width: 110,
                  ),
                  Text("Precio: $Precio ", style:TextStyle(fontSize:20,color:Colors.black),
                  ),
                  Column(
                    children:[
                      Container(
                        //margin
                        margin:EdgeInsets.all(10),
                      ),
                      Text("SUPER", style:TextStyle(fontSize:20,color:Colors.black)),
                      Image.asset(
                        "assets/gas.png",
                        height: 110,
                        width: 110,
                      ),
                      Text("Precio: $Precio2", style:TextStyle(fontSize:20,color:Colors.black)),
                      Column(
                          children:[
                            Container(
                              //margin
                              margin:EdgeInsets.all(10),
                            ),
                            Text("DIESEL", style:TextStyle(fontSize:20,color:Colors.black)),
                            Image.asset(
                              "assets/gas.png",
                              height: 110,
                              width: 110,
                            ),
                            Text("Precio: $Precio3", style:TextStyle(fontSize:20,color:Colors.black)),
                            Column(

                              children:[
                                Container(
                                  //margin
                                  margin:EdgeInsets.only(top:5,bottom:5),
                                ),

                              ],
                            ),
                          ]
                      ),
                    ]

                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    ]
  );
}

