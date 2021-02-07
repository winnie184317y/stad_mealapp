import 'package:flutter/material.dart';
import 'package:mealapp/screens/home/home.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calories Calculator',
      theme: ThemeData(
        primaryColor: Colors.blue[400],
        accentColor: Colors.amber,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  //text field font
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  //variables
  var minimumPadding = 10.0;
  var isDouble = false;

  TextEditingController displayController = new TextEditingController();

  var num1 = 0.0;
  var num2 = 0.0;
  var operand = '';


  //Methods
  //a text which will be displayed on that button and a function which
  //describes what I want to do with that button
  Widget buildButton(String text, Function handler) {
    //Expanded is to prevent overflow 
    return Expanded(
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Digital-7',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: handler,
      ),
    );
  }

  //Adding logic into the buttons
  //when we press the button, it will display out the assigned char
  void digitalHandler(String char) {
    displayController.text = displayController.text + char;
  }

  void pointHandler() {
    //if a decimal is detected, then don't add 1 more, else add a decimal
    if (isDouble == false) {
      displayController.text = displayController.text + '.';
      isDouble = true;
    }
  }

  void delHandler() {
    //retrieve the text has has been displaying in text field
    String result = displayController.text;
    if (result.length > 0) {
      //the text should be updated into current text - the last char
      displayController.text = result.substring(0, result.length - 1);
    } else if (result.length == 0) {
      displayController.clear();
    }
  }

  void signHandler() {
    String result = displayController.text;
    //converting the result value into doubles
    double num = double.parse(result);
    if (num == 0) {
      //if value is 0, we just don't add - to the value
      return;
    }
    num = num * -1;
    //checking if the current value is an integer
    if (num * 10 % 10 == 0) {
      //don't want any fraction
      displayController.text = num.toStringAsFixed(0);
    } else {
      displayController.text = num.toString();
    }
  }

  void operandHandler(String text)
  {
    num1 = double.parse(displayController.text);
    switch(text)
    {
      case '+':
        operand='+';
        break;

      case '-':
        operand='-';
        break;

      case '*':
        operand='*';
        break;

      case '/':
        operand='/';
        break;
    }

    // print(num1);
    // print(operand);
    displayController.clear();
  }

  void equalHandler()
  {
    num2 = double.parse(displayController.text);
    displayController.clear();
    double result;
    switch(operand)
    {
      case '+':
        result= num1+num2;
        break;

      case '-':
        result= num1-num2;
        break;

      case '*':
        result= num1*num2;
        break;

      case '/':
        result= num1/num2;
        break;
    }
    if(result==null)
    {
      //do nothing
      return;
    }
    displayController.text = result.toString();
  }

  void clearHandler()
  {
    //revert the variables to initial state
    num1=0.0;
    num2=0.0;
    operand = '';
    isDouble=false;
    displayController.clear();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Home()));
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(minimumPadding),
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
              child: TextField(
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.title,
                //disallow user to type in textfield
                showCursor: true,
                readOnly: true,
                //with this controller object, we will be able to access our textfield
                controller: displayController,
                decoration: InputDecoration(
                  //textfield border
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),

            //first row
            Padding(
              padding:
                  EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
              child: Row(
                children: <Widget>[
                  buildButton('7', () {
                    digitalHandler('7');
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('8', () {
                    digitalHandler('8');
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('9', () {
                    digitalHandler('9');
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('-',(){operandHandler('-');}),
                ],
              ),
            ),

            //second row
            Padding(
              padding:
                  EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
              child: Row(
                children: <Widget>[
                  buildButton('4', () {
                    digitalHandler('4');
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('5', () {
                    digitalHandler('5');
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('6', () {
                    digitalHandler('6');
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('+', () {operandHandler('+');}),
                ],
              ),
            ),

            //third row
            Padding(
              padding:
                  EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
              child: Row(
                children: <Widget>[
                  buildButton('1', () {
                    digitalHandler('1');
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('2', () {
                    digitalHandler('2');
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('3', () {
                    digitalHandler('3');
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('*', () {operandHandler('*');}),
                ],
              ),
            ),

            //fourth row
            Padding(
              padding:
                  EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
              child: Row(
                children: <Widget>[
                  buildButton('.',(){pointHandler();}),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('0', () {
                    digitalHandler('0');
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('+/-', () {
                    signHandler();
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('/', () {operandHandler('/');}),
                ],
              ),
            ),

            //fifth row
            Padding(
              padding:
                  EdgeInsets.only(top: minimumPadding, bottom: minimumPadding),
              child: Row(
                children: <Widget>[
                  buildButton('DEL', () {
                    delHandler();
                  }),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('=',(){equalHandler();}),
                  SizedBox(
                    width: minimumPadding,
                  ),
                  buildButton('CLEAR',(){clearHandler();}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
