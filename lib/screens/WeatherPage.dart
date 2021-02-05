import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xff3B86F7),
          body: Stack(
            children: [
              Container(
                width: 360,
                height: 80,
                decoration:
                    BoxDecoration(color: const Color(0xff3B86F7), boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withOpacity(0.2),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Locations',
                        style: GoogleFonts.roboto(fontStyle: FontStyle.normal)),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
