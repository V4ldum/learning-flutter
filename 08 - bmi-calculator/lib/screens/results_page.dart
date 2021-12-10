import 'package:flutter/material.dart';
import '../components/card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../bmi_calculator.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;

  ResultsPage(
      {@required this.bmi,
      @required this.result,
      @required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text("Your Result", style: kTitleTextStyle),
          ),
          Expanded(
            child: MyCard(
              color: kActiveCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(result.toUpperCase(), style: kResultTextStyle),
                  Text(bmi, style: kBMITextStyle),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              text: "RE-CALCULATE",
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
