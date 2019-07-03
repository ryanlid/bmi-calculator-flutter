import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bimResult,
      @required this.bimResultText,
      @required this.interpretation});

  final String bimResult;
  final String bimResultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Text(
                  "Your result",
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bimResultText,
                      style: resultTextStyle,
                    ),
                    Text(
                      bimResult,
                      style: kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'Re-calculate',
            ),
          ],
        ),
      ),
    );
  }
}
