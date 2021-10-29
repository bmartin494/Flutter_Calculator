import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:calculator/calculator_value.dart';
import 'package:calculator/calculator_button_row.dart';
import 'package:provider/provider.dart';

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
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  //need to make the buttonColor Color declaration nullable (?) otherwise you cannot use the color shading e.g. [700]

  @override
  Widget build(BuildContext context) {
    String displayValue = Provider.of<CalculatorValue>(context).numberString;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.title,
        style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.grey.shade300,
              height: MediaQuery.of(context).size.height / 3,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: Text(
                    displayValue,
                    style: TextStyle(fontSize: 80.0),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  CalculatorButtonRow(
                    title1: "AC",
                    title2: "=/-",
                    title3: "%",
                    title4: "/",
                    textColor1: Colors.black,
                    textColor2: Colors.white,
                    buttonColor1: Colors.grey,
                    buttonColor2: Colors.amber[600],

                  ),
                  CalculatorButtonRow(
                    title1: "7",
                    title2: "8",
                    title3: "9",
                    title4: "x",
                    textColor1: Colors.white,
                    textColor2: Colors.white,
                    buttonColor1: Colors.grey[800],
                    buttonColor2: Colors.amber[600],
                  ),
                  CalculatorButtonRow(
                    title1: "4",
                    title2: "5",
                    title3: "6",
                    title4: "-",
                    textColor1: Colors.white,
                    textColor2: Colors.white,
                    buttonColor1: Colors.grey[800],
                    buttonColor2: Colors.amber[600],
                  ),
                  CalculatorButtonRow(
                    title1: "1",
                    title2: "2",
                    title3: "3",
                    title4: "+",
                    textColor1: Colors.white,
                    textColor2: Colors.white,
                    buttonColor1: Colors.grey[800],
                    buttonColor2: Colors.amber[600],
                  ),
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
                CalculatorButton(
                    buttonText: '.',
                    buttonColor: Colors.white,
                    textColor: Colors.grey[800],
                ),
                CalculatorButton(
                    buttonText: '=',
                    buttonColor: Colors.amber[600],
                    textColor: Colors.white),
              ],
            ),
            const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 5),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             //calculator display
//               ResultDisplay(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   //here button functionality is called where we pass some arguments
//                   calcButton('AC', Colors.grey, Colors.black),
//                   calcButton('+/-', Colors.grey, Colors.black),
//                   calcButton('%', Colors.grey, Colors.black),
//                   calcButton('/', Colors.amber[600], Colors.white),
//                 ],
//               ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 //here button functionality is called where we pass some arguments
//                 calcButton('7', Colors.grey[800], Colors.white),
//                 calcButton('8', Colors.grey[800], Colors.white),
//                 calcButton('9', Colors.grey[800], Colors.white),
//                 calcButton('x', Colors.amber[600], Colors.white),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 //here button functionality is called where we pass some arguments
//                 calcButton('4', Colors.grey[800], Colors.white),
//                 calcButton('5', Colors.grey[800], Colors.white),
//                 calcButton('6', Colors.grey[800], Colors.white),
//                 calcButton('-', Colors.amber[600], Colors.white),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 //here button functionality is called where we pass some arguments
//                 calcButton('1', Colors.grey[800], Colors.white),
//                 calcButton('2', Colors.grey[800], Colors.white),
//                 calcButton('3', Colors.grey[800], Colors.white),
//                 calcButton('+', Colors.amber[600], Colors.white),
//               ],
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 //here button functionality is called where we pass some arguments
//                 ElevatedButton(
//                   onPressed: () {
//
//                   },
//                   child: const Text("0",
//                     style: TextStyle(
//                       fontSize: 35,
//                       color: Colors.white,
//                     ),
//                   ),
//                   //all this styling is new from tutorial followed
//                   style: ElevatedButton.styleFrom(
//                     shape : const StadiumBorder(),
//                     primary: Colors.grey[800],
//                     padding: const EdgeInsets.fromLTRB(28, 20, 128, 20),
//                   ),
//                 ),
//                 calcButton('.', Colors.grey[800], Colors.white),
//                 calcButton('=', Colors.amber[600], Colors.white),
//               ],
//             ),
//             const SizedBox(height: 25),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ResultDisplay extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: const [
//             Padding(padding: EdgeInsets.all(10.0),
//               child: Text(
//                 '0',
//                 textAlign: TextAlign.left,
//                 style: TextStyle(color: Colors.white, fontSize: 100),
//               ),
//             )
//           ],
//         );
//   }
// }