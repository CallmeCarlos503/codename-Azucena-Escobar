import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gasolinera_puma/Principal.dart';
import 'package:popover/popover.dart';
import 'package:url_launcher/url_launcher.dart';
import 'SQL/db.dart';
import 'detalles.dart';

class Maps extends StatelessWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: drawerP(),
      appBar: AppBar(
        title: const Text('Gasolinera puma'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: background(),
    );
  }
}

Widget background() {
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
        child: ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
            ),
            Lista(),
          ],
        )
      ],
    )),
  );
}

Widget cartas(String nombre, String Coordenadas) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.local_gas_station,
                color: Colors.amberAccent,
                size: 40,
              ),
              title: Text(nombre),
              subtitle: Text('Gasolineria Puma ' + nombre),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(width: 8),


                GestureDetector(

                  child: const Text('Detalles', style: TextStyle(
                    color: Colors.blue,
                  ),),
                    onTap:(){
                      _irAlDetalle();
                    }
                ),
                TextButton(
                  child: const Text('Ver el mapa'),
                  onPressed: () {
                    //uso del url launcher

                    //alert dialog al estilo IOS
                    showDialog(
                      context: ContextP!,
                      builder: (BuildContext context) {
                        return  CupertinoAlertDialog(
                          title: const Text('Ver el mapa'),
                          content: const Text('estas seguro de ver el mapa?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancelar'),
                            ),
                            TextButton(
                              child: const Text('ir al mapa'),
                              onPressed: () {
                                launch('https://www.google.com/maps/place/' + Coordenadas);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget Lista() {
  return FutureBuilder<List<Map<String, dynamic>>>(
      future: Db.mostrarDepartamento(),
      builder: (BuildContext context,
          AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error al cargar los datos');
        } else {
          List<Map<String, dynamic>> data = snapshot.data ?? [];
          List<String> nombres =
              data.map((item) => item['NOMBRE'] as String).toList();
          List<String> coordenadas =
              data.map((item) => item['COORDENADAS'] as String).toList();

          //List<int> valores = data.map((item) => item['ID'] as int).toList();

          int cantidad = nombres.length;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(cantidad, (index) {
              return cartas(nombres[index], coordenadas[index]);
            }),
          );
        }
      });
}


void _irAlDetalle(){

  Navigator.of(ContextP!).push(MaterialPageRoute(
      builder: (_) => backgroundD()
  ));
}