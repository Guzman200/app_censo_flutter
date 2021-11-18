import 'package:flutter/material.dart';
import 'package:ins/model/persona.dart';
import 'package:ins/sql/db.dart';

class MyTablePage extends StatefulWidget {
  const MyTablePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyTablePage> createState() => _MyTablePageState();
}

class _MyTablePageState extends State<MyTablePage> {
  List<Persona> personas = [];

  @override
  void initState() {
    cargaPersonas();
    super.initState();
  }

  cargaPersonas() async {
    List<Persona> auxPersonas = await DB.personas();

    setState(() {
      personas = auxPersonas;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(10,10,10,0),
          //height: 220,
          width: double.maxFinite,
          child: ListView.builder(
            itemCount: personas.length,
            itemBuilder: (context, i) =>
                Dismissible(
                  key: Key(i.toString()),
                  child: Card(
                      child: Column(
                        children: [
                          // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
                          ListTile(
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                            title: Text('Nombre: ' + personas[i].nombre),
                            subtitle: Text(
                                'Correo electrónico: ' + personas[i].correo),
                            leading: Icon(Icons.face_unlock_sharp),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                            title: Text('Habitantes: ' + personas[i].totalHabitantes),
                            subtitle: Text(
                                'Personas vacunadas: ' + personas[i].numPersonasVacunadas),
                            leading: Icon(Icons.article_outlined),
                          ),
                          ListTile(
                              contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                              title: Text('Dirección: ' + personas[i].direccion),
                              subtitle: Text('Código postal: ' + personas[i].codigoPostal),
                              leading: Icon(Icons.fmd_good_outlined)
                          ),
                          // Usamos una fila para ordenar los botones del card
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlatButton(onPressed: () => {}, child: Text(personas[i].fechaEntrevista)),

                            ],
                          )
                        ],
                      )
                  ),
            ),
          ),
        ),
    );
  }
}
