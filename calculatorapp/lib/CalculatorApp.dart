import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget Button(btn) {
    return Container(
      width: 80,
      height: 60,
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(5),
      child: ElevatedButton.icon(
        label: Text(
          btn,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
        icon: Icon(Icons.calculate),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // <-- Radius
          ),
          shadowColor: Colors.grey,
          primary: Colors.black,
          onPrimary: Colors.white,
          side: BorderSide(color: Colors.black, width: 3),
        ),
        onPressed: () {
          setState(() {
            result = result + btn;
          });
        },
      ),
    );
  }

  clear() {
    setState(() {
      result = "";
    });
  }

  Output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
            ),
              child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage("https://w7.pngwing.com/pngs/486/222/png-transparent-computer-icons-calculator-calculation-calculator-blue-electronics-logo.png")
                ),
              ),
            SizedBox(height: 30,),
              Container(
                height: 70,
                width: 400,
                child: Center(
                  child: Text(
                    result,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "serif",
                        fontSize: 20),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 60,
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton.icon(
                      label: Text(
                        "AC",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      icon: Icon(Icons.calculate),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                        shadowColor: Colors.grey,
                        primary: Colors.red,
                        onPrimary: Colors.white,
                        side: BorderSide(color: Colors.red, width: 3),
                      ),
                      onPressed: () {
                        clear();
                      },
                    ),
                  ),
                  Button("("),
                  Button(")"),
                  Container(
                    width: 80,
                    height: 60,
                    margin: EdgeInsets.all(0),
                    padding: EdgeInsets.all(5),
                    child: ElevatedButton.icon(
                      label: Text(
                        "=",
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      icon: Icon(Icons.calculate),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // <-- Radius
                        ),
                        shadowColor: Colors.grey,
                        primary: Colors.green,
                        onPrimary: Colors.white,
                        side: BorderSide(color: Colors.green, width: 3),
                      ),
                      onPressed: () {
                        Output();
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button("1"),
                  Button("2"),
                  Button("3"),
                  Button("%"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button("4"),
                  Button("5"),
                  Button("6"),
                  Button("/"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button("7"),
                  Button("8"),
                  Button("9"),
                  Button("*"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button("."),
                  Button("0"),
                  Button("+"),
                  Button("-"),
                ],
              )
            ],
          ),
              ),
            ),
        ));
  }
}
