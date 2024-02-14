import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController KgController = TextEditingController();
    TextEditingController feetController = TextEditingController();
    TextEditingController InchController = TextEditingController();

    //over red
    //under yellow
    //healthy green
    var bgcolor = Colors.grey.shade100;
    var result=" ";

    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'BMI Calculator',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),

                //KG
                TextField(
                  controller: KgController,
                  decoration: InputDecoration(
                    label: Text('Enter KG'),
                    prefixIcon: Icon(Icons.line_style),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                //Feet
                TextField(
                  controller: feetController,
                  decoration: InputDecoration(
                    label: Text('Enter Feet'),
                    prefixIcon: Icon(Icons.line_style),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                //Inch
                TextField(
                  controller: InchController,
                  decoration: InputDecoration(
                    label: Text('Enter Inch'),
                    prefixIcon: Icon(Icons.line_style),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                //calculate

                ElevatedButton(
                  onPressed: () {
                    var weight = KgController.text;
                    var feet = feetController.text;
                    var inch = InchController.text;



                    if (weight != "" && feet != "" && inch != "") {

                      var Integerwt = double.parse(weight);
                      var Integerft = double.parse(feet);
                      var Integerinch = double.parse(inch);
                      //BMI calculator
                      print("Tap");
                      var totalInch = (Integerft * 12) + Integerinch;
                      var totalCm = totalInch * 2.54;
                      var totalMeter = totalCm / 100;
                      var bmi = Integerwt / totalMeter * totalMeter;

                      var msg = "";

                      //bmi>25
                      if (bmi > 25) {
                        msg = "You are over weight";
                        bgcolor = Colors.red;
                        //bmi < 18
                      } else if (bmi < 18) {
                        msg = "You are under weight";
                        bgcolor = Colors.yellow;
                      } else {
                        msg = "You are healthy";
                        bgcolor = Colors.green;
                      }
                      setState(() {
                        result =
                            "$msg\n\n your BMI is ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the details";
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(700, 70),
                  ),
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                ),
                Text('${result}')
              ],
            ),
          ),
        );
      },
    );
  }
}
