import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.greenAccent, Colors.tealAccent[700]])),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: FractionallySizedBox(
                  widthFactor: 0.8,
                  heightFactor: 0.8,
                  child: Column(
                    children: <Widget>[
                      TextField(
                        style: GoogleFonts.bebasNeue(fontSize: 60),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            hintText: "75 kgs",
                            hintStyle:
                                GoogleFonts.bebasNeue(color: Colors.grey),
                            labelText: "PESO",
                            labelStyle: TextStyle(
                                color: Colors.greenAccent, fontSize: 40),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2))),
                      ),
                      TextField(
                        style: GoogleFonts.bebasNeue(fontSize: 60),
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                            hintText: "172 cms",
                            hintStyle:
                                GoogleFonts.bebasNeue(color: Colors.grey),
                            labelText: "ALTURA",
                            labelStyle: TextStyle(
                                color: Colors.greenAccent, fontSize: 40),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 2))),
                      ),
                    ],
                  )),
            ),
          ),
        ),
      )),
    );
  }
}
