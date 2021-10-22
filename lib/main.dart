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
      home: Calculator(title: 'Flutter Calculator'),
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

  Widget calcButton(String buttonText, Color buttonColor, Color textColor) {
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
          padding: const EdgeInsets.all(20),
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
                  calcButton('/', Colors.grey, Colors.black),
                ],
              ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here button functionality is called where we pass some arguments
                calcButton('AC', Colors.grey, Colors.black),
                calcButton('+/-', Colors.grey, Colors.black),
                calcButton('%', Colors.grey, Colors.black),
                calcButton('/', Colors.grey, Colors.black),
              ],
            ),
            SizedBox(height: 10),Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here button functionality is called where we pass some arguments
                calcButton('AC', Colors.grey, Colors.black),
                calcButton('+/-', Colors.grey, Colors.black),
                calcButton('%', Colors.grey, Colors.black),
                calcButton('/', Colors.grey, Colors.black),
              ],
            ),
            SizedBox(height: 10),Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //here button functionality is called where we pass some arguments
                calcButton('AC', Colors.grey, Colors.black),
                calcButton('+/-', Colors.grey, Colors.black),
                calcButton('%', Colors.grey, Colors.black),
                calcButton('/', Colors.grey, Colors.black),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
