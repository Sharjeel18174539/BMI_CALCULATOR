import 'package:flutter/material.dart';
import 'Input_page.dart';
import 'reusable_column.dart';
class resultPage extends StatelessWidget {
   resultPage({required this.bmiResult, required this.resultInterpretation, required this.resultText});
   final String bmiResult;
   final String resultText;
   final String resultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Center(child: Text("BMI CALCULATOR")),
      ),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                  child: const Text('YOUR RESULT',
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
              ),
          ),
          Expanded(
            flex: 5,
            child:ReusableCard(
            colour: activeCard,
            childCard: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(resultText,
                style: const TextStyle(
                  fontSize: 22.0,
                  color: Color(0xFF24D876),
                  fontWeight: FontWeight.bold,
                ),
                ),
                Text(bmiResult,
                  style: const TextStyle(
                    fontSize: 100.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(resultInterpretation,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22.0,
                ),
                ),
              ],
            ),
          ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage(),),);
            },
            child: Container(
              child: const Center(
                child: Text('RECALCULATE',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              color: bottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ),
        ],
      ),

    );
  }
}
