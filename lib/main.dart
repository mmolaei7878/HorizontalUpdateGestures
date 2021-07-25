import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Slidezz(),
    );
  }
}

class Slidezz extends StatefulWidget {
  @override
  _SlidezzState createState() => _SlidezzState();
}

class _SlidezzState extends State<Slidezz> {
  double positionContainer = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 350,
          color: Colors.amber[200],
          child: Stack(
            children: [
              Positioned(
                  bottom: 0.0,
                  child: Container(
                    color: Colors.green[300],
                    width: 350,
                    height: 65,
                  )),
              Positioned(
                bottom: 0.0,
                left: positionContainer,
                child: GestureDetector(
                  onHorizontalDragUpdate: (v) {
                    print(v.globalPosition.dx);
                    setState(() {
                      positionContainer = (v.globalPosition.dx - 20);
                      print(positionContainer);
                    });

                    if (positionContainer >= 285) {
                      setState(() {
                        positionContainer = 285;
                      });
                    }
                  },
                  /* onHorizontalDragCancel: () {
                      if (positionContainer > 0.0) {
                        setState(() {
                          positionContainer = 0.0;
                        });
                      }
                    }, */
                  onHorizontalDragEnd: (v) {
                    if (positionContainer >= 285) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SecondScreen()),
                      );
                    }
                    if (positionContainer > 0.0) {
                      setState(() {
                        positionContainer = 0.0;
                      });
                    }
                  },
                  child: Container(
                    width: 65,
                    height: 65,
                    color: Colors.green[500],
                    child: Icon(
                      Icons.keyboard_arrow_right_sharp,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.present_to_all_sharp),
        onPressed: () {
          setState(() {
            positionContainer = 0.0;
          });
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
      ),
      body: Center(
        child: Text('YOUR ARE IN NEW SCREEN'),
      ),
    );
  }
}
