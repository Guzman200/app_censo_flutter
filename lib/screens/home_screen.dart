import 'package:flutter/material.dart';
import 'package:ins/screens/form_screen.dart';
import 'package:ins/screens/table_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        // Generate 100 widgets that display their index in the List.
        mainAxisSpacing: 0,
        children: [
          /*Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton.icon(
                    label: Text('Registrar datos'),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const MyFormPage(title: 'Registro')
                          )
                      )
                    },
                    icon: const Icon(Icons.article_outlined, size: 100)
                ),
          ),
          Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton.icon(
                  label: const Text('Visualizar datos'),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              const MyTablePage(title: 'Registros')))
                    },
                    icon: const Icon(Icons.assessment, size: 100)
                ),
          ),*/
          Padding(
            padding: const EdgeInsets.all(20),
            child: FlatButton(
              onPressed: () => {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const MyFormPage(title: 'Registro')
                    )
                )

              },
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.only(top: 40),
              child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.article_outlined),
                  Text("Registrar datos")
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: FlatButton(
              onPressed: () => {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const MyTablePage(title: 'Registros')
                    )
                )


              },
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.only(top: 40),
              child: Column( // Replace with a Row for horizontal icon + text
                children: <Widget>[
                  Icon(Icons.assessment),
                  Text("Visualizar datos")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
