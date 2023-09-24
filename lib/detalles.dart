import 'package:flutter/material.dart';

import 'Principal.dart';
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
              Decoration(),
            ],
          ),
        ],
      ),

    ),
  );
}

Widget Decoration(){
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
                "NEJAPA", style:TextStyle(fontSize:25),
              ),
              Image.asset(
                "assets/logo.png",
                height: 160,
                width: 160,
              ),
              Column(
                children:[
                  //listview
                  Text("REGULAR", style:TextStyle(fontSize:20)),
                  Image.asset(
                    "assets/gas.png",
                    height: 110,
                    width: 110,
                  ),
                  Text("Precio: 80.00 ", style:TextStyle(fontSize:20),
                  ),
                  Column(
                    children:[
                      Container(
                        //margin
                        margin:EdgeInsets.all(10),
                      ),
                      Text("SUPER", style:TextStyle(fontSize:20)),
                      Image.asset(
                        "assets/gas.png",
                        height: 110,
                        width: 110,
                      ),
                      Text("Precio: 80", style:TextStyle(fontSize:20)),
                      Column(
                          children:[
                            Container(
                              //margin
                              margin:EdgeInsets.all(10),
                            ),
                            Text("DIESEL", style:TextStyle(fontSize:20)),
                            Image.asset(
                              "assets/gas.png",
                              height: 110,
                              width: 110,
                            ),
                            Text("Precio: 80", style:TextStyle(fontSize:20)),
                            Column(

                              children:[
                                Container(
                                  //margin
                                  margin:EdgeInsets.only(top:5,bottom:5),
                                ),
                              ElevatedButton(
                                onPressed: (){
                                  Navigator.push(
                                    contexto!,
                                    MaterialPageRoute(builder: (context) => Principal()),
                                  );
                                },
                                child: Text("IR AL MAPA"),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              )
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

