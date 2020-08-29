import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Converter(title: 'Flutter Demo Home Page'),
    );
  }
}

class Converter extends StatefulWidget {
  Converter({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  double tempF = 0;
  double tempK = 0;
  double tempR = 0;
  double tempRe = 0;

  void _convert(String value) {
    double tempC = 0;
    if (value != "") {
      tempC = double.parse(value);
    }

    setState(() {
      tempF = double.parse((tempC * (9 / 5) + 32).toStringAsFixed(2));
      tempK = double.parse((tempC + 273.15).toStringAsFixed(2));
      tempR = double.parse((tempC * (4 / 5)).toStringAsFixed(2));
      tempRe = double.parse((tempC * (9 / 5) + 491.67).toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [
      _fahrenheit(tempF),
      _kelvin(tempK),
      _reaumur(tempR),
      _rankine(tempRe),
    ];

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("CELSIUS",
                      style: GoogleFonts.barlowSemiCondensed(
                          letterSpacing: 5,
                          color: Colors.white,
                          fontSize: 55,
                          fontWeight: FontWeight.w200)),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextField(
                        onChanged: (value) => _convert(value),
                        maxLength: 4,
                        textAlign: TextAlign.center,
                        showCursor: false,
                        decoration: InputDecoration(
                            counterStyle: TextStyle(color: Colors.white),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 3),
                            )),
                        style: GoogleFonts.barlowSemiCondensed(
                            color: Colors.white,
                            fontSize: 90,
                            fontWeight: FontWeight.w400)),
                  )
                ],
              ),
              color: Colors.red,
            ),
          ),
          Expanded(
              child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return steps[index];
            },
            loop: false,
            itemCount: steps.length,
            control: SwiperControl(color: Colors.white),
          ))
        ],
      ),
    );
  }
}

Widget _fahrenheit(double tempF) {
  return Container(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("FAHRENHEIT",
            style: GoogleFonts.barlowSemiCondensed(
                letterSpacing: 5,
                color: Colors.white,
                fontSize: 55,
                fontWeight: FontWeight.w200)),
        Text('$tempF',
            style: GoogleFonts.barlowSemiCondensed(
                color: Colors.white,
                fontSize: 90,
                fontWeight: FontWeight.w400)),
      ],
    ),
    color: Colors.amber,
  );
}

Widget _kelvin(double tempK) {
  return Container(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("KELVIN",
            style: GoogleFonts.barlowSemiCondensed(
                letterSpacing: 5,
                color: Colors.white,
                fontSize: 55,
                fontWeight: FontWeight.w200)),
        Text('$tempK',
            style: GoogleFonts.barlowSemiCondensed(
                color: Colors.white,
                fontSize: 90,
                fontWeight: FontWeight.w400)),
      ],
    ),
    color: Colors.lightBlue,
  );
}

Widget _reaumur(double tempR) {
  return Container(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("RÉAUMUR",
            style: GoogleFonts.barlowSemiCondensed(
                letterSpacing: 5,
                color: Colors.white,
                fontSize: 55,
                fontWeight: FontWeight.w200)),
        Text('$tempR',
            style: GoogleFonts.barlowSemiCondensed(
                color: Colors.white,
                fontSize: 90,
                fontWeight: FontWeight.w400)),
      ],
    ),
    color: Colors.purple,
  );
}

Widget _rankine(double tempRe) {
  return Container(
    width: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text("RANKINE",
            style: GoogleFonts.barlowSemiCondensed(
                letterSpacing: 5,
                color: Colors.white,
                fontSize: 55,
                fontWeight: FontWeight.w200)),
        Text('$tempRe',
            style: GoogleFonts.barlowSemiCondensed(
                color: Colors.white,
                fontSize: 90,
                fontWeight: FontWeight.w400)),
      ],
    ),
    color: Colors.cyan,
  );
}
