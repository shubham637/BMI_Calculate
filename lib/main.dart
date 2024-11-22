import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController kgController = TextEditingController();
  TextEditingController heightFeetController = TextEditingController();
  TextEditingController heightInchController = TextEditingController();

  String result = '';

  void bmiCalculate() {
    int kg = int.parse(kgController.text.toString());
    int heightFeet = int.parse(heightFeetController.text.toString());
    int heightInch = int.parse(heightInchController.text.toString());

    int totalIn = (heightFeet * 12) + heightInch;
    double heightCm = totalIn * 2.54;
    double heightM = heightCm / 100;
    num bmi = kg / (pow(heightM, 2));
    setState(() {
      if (bmi < 16) {
        result = 'Your BMI is ${bmi.toStringAsFixed(2)} (Severe Thinness)';
      } else if (bmi >= 16 && bmi < 17) {
        result = 'Your BMI is ${bmi.toStringAsFixed(2)} (Moderate Thinness)';
      } else if (bmi >= 17 && bmi < 18.5) {
        result = 'Your BMI is ${bmi.toStringAsFixed(2)} (Mild Thinness)';
      } else if (bmi >= 18.5 && bmi < 25) {
        result = 'Your BMI is ${bmi.toStringAsFixed(2)} (Normal)';
      } else {
        result = 'Your BMI is ${bmi.toStringAsFixed(2)} (Overweight)';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: kgController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Weight(Kg)"),
                hintText: "Enter your weight",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: heightFeetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Height(feet)"),
                hintText: "Enter your height in feet",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: heightInchController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Height(Inch)"),
                hintText: "Enter your height in Inch",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    5,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                bmiCalculate();
              },
              child: Text('Calculate'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Result :- $result",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
