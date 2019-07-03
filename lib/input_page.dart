import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'calculatorBrain.dart';
import 'result_page.dart';

enum Gender { male, female }

const labelTextStyle = {
//  fontSiz
};

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInActiveCardColour;
  Color femaleCardColour = kInActiveCardColour;
  int height = 130;
  int weight = 60;
  int age = 25;

  void updateColour(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColour == kInActiveCardColour) {
        maleCardColour = kActiveCardColour;
        femaleCardColour = kInActiveCardColour;
      } else {
        maleCardColour = kInActiveCardColour;
      }
    }
    if (gender == Gender.female) {
      if (femaleCardColour == kInActiveCardColour) {
        femaleCardColour = kActiveCardColour;
        maleCardColour = kInActiveCardColour;
      } else {
        femaleCardColour = kInActiveCardColour;
      }
    }
  }

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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('MALE');
                        setState(() {
                          updateColour(Gender.male);
                        });
                      },
                      child: ReusableCard(
                        colour: maleCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('FEMALE');
                        setState(() {
                          updateColour(Gender.female);
                        });
                      },
                      child: ReusableCard(
                        colour: femaleCardColour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Height',
                            style: TextStyle(fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(
                                height.toString(),
                                style: TextStyle(fontSize: 30),
                              ),
                              Text(
                                'cm',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
//                              inactiveTrackColor: Color(0xFF8D8E98),
//                              activeTrackColor: Colors.white,
//                              thumbColor: Color(0xFFEB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
//                            SliderThemeData(
//                                trackHeight: null,
//                                activeTrackColor: null,
//                                inactiveTrackColor: null,
//                                disabledActiveTrackColor: null,
//                                disabledInactiveTrackColor: null,
//                                activeTickMarkColor: null,
//                                inactiveTickMarkColor: null,
//                                disabledActiveTickMarkColor: null,
//                                disabledInactiveTickMarkColor: null,
//                                thumbColor: null,
//                                disabledThumbColor: null,
//                                overlayColor: null,
//                                valueIndicatorColor: null,
//                                trackShape: null,
//                                tickMarkShape: null,
//                                thumbShape: null,
//                                overlayShape: null,
//                                valueIndicatorShape: null,
//                                showValueIndicator: null,
//                                valueIndicatorTextStyle: null,
//                                ),
                            child: Slider(
                              value: height.toDouble(),
                              activeColor: Color(0xFFEB1555),
                              inactiveColor: Color(0xFF8D8E98),
                              onChanged: (double value) {
                                print(value);
                                setState(() {
                                  height = value.round();
                                });
                              },
                              max: 220,
                              min: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            weight.toString(),
                            style: TextStyle(fontSize: 40.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(fontSize: 40.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SafeArea(
                          child: ResultPage(
                            bimResult: calc.calculateBMI(),
                            bimResultText: calc.getResult(),
                            interpretation: calc.getInterpretation(),
                          ),
                        ),
                  ),
                );

//                Navigator.pushNamed(context, "ResultPage",{
//                  bimResult:calc.getResult(),
//
//                });
              },
              buttonTitle: "Calculate",
            ),
          ],
        ),
      ),
//      floatingActionButton: FloatingActionButton(
//        child: Icon(Icons.add),
//      ),
//      floatingActionButton: Theme(
//        data: ThemeData(accentColor: Colors.purple),
//        child: FloatingActionButton(
//          child: Icon(Icons.add),
//        ),
//      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;

  RoundIconButton({this.onPressed, this.child});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      fillColor: Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: child,
    );
  }
}
