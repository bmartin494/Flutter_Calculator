import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Calculator(title: 'Flutter Calculator'),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  //need to make the buttonColor Color declaration nullable (?) otherwise you cannot use the color shading e.g. [700]
  Widget calcButton(String buttonText, Color? buttonColor, Color textColor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {

        },
        child: Text(buttonText,
          style: TextStyle(
            fontSize: 35,
            color: textColor,
          ),
        ),
        //all this styling is new from tutorial followed
        style: ElevatedButton.styleFrom(
          shape : const CircleBorder(),
          primary: buttonColor,
          padding: const EdgeInsets.all(0),
          minimumSize: const Size(80, 80),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title,
        style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            //calculator display
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(padding: EdgeInsets.all(10.0),
                    child: Text('0',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.white, fontSize: 100),
                      ),
                    )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //here button functionality is called where we pass some arguments
                  calcButton('AC', Colors.grey, Colors.black),
                  calcButton('+/-', Colors.grey, Colors.black),
                  calcButton('%', Colors.grey, Colors.black),
                  calcButton('/', Colors.amber[600], Colors.white),
                ],
              ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here button functionality is called where we pass some arguments
                calcButton('7', Colors.grey[800], Colors.white),
                calcButton('8', Colors.grey[800], Colors.white),
                calcButton('9', Colors.grey[800], Colors.white),
                calcButton('x', Colors.amber[600], Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here button functionality is called where we pass some arguments
                calcButton('4', Colors.grey[800], Colors.white),
                calcButton('5', Colors.grey[800], Colors.white),
                calcButton('6', Colors.grey[800], Colors.white),
                calcButton('-', Colors.amber[600], Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here button functionality is called where we pass some arguments
                calcButton('1', Colors.grey[800], Colors.white),
                calcButton('2', Colors.grey[800], Colors.white),
                calcButton('3', Colors.grey[800], Colors.white),
                calcButton('+', Colors.amber[600], Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here button functionality is called where we pass some arguments
                ElevatedButton(
                  onPressed: () {

                  },
                  child: const Text("0",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                  //all this styling is new from tutorial followed
                  style: ElevatedButton.styleFrom(
                    shape : const StadiumBorder(),
                    primary: Colors.grey[800],
                    padding: const EdgeInsets.fromLTRB(28, 20, 128, 20),
                  ),
                ),
                calcButton('.', Colors.grey[800], Colors.white),
                calcButton('=', Colors.amber[600], Colors.white),
              ],
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
