import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_column.dart';
import 'result_page.dart';

const bottomContainerHeight=80.0;
const activeCard= Color(0xFF1D1E33);
const inactiveCard=Color(0xFF111328);
const  bottomContainerColour= Color(0xFFEB1555);

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

    Gender selectGender=Gender.male;
    int height=180;
    int weight=60;
    int age =16;
    //we can write the code like this also instead of using enum and ternary operator but the code is too long.
  // Color maleCard=inactiveCard;
  // Color femaleCard=inactiveCard;
  // void update(Gender selectGender){
  //   if(selectGender==Gender.male){
  //     if(maleCard==inactiveCard){
  //       maleCard=activeCard;
  //       femaleCard=inactiveCard;
  //     }
  //     else{
  //       maleCard=inactiveCard;
  //     }
  //   }
  //   if(selectGender==Gender.female){
  //     if(femaleCard==inactiveCard){
  //       femaleCard=activeCard;
  //       maleCard=inactiveCard;
  //     }
  //     else{
  //       femaleCard=inactiveCard;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: 
          Row(
            children: [
              Expanded(child:
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        selectGender=Gender.male;

                      });
                    },
                    child: ReusableCard(
                      colour: selectGender==Gender.male?activeCard:inactiveCard,
                      childCard: IconContent(
                        text: 'MALE',
                        icon: FontAwesomeIcons.mars,
                      ),
                    ),
                  ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectGender=Gender.female;
                    });
                  },
                  child: ReusableCard(
                  colour: selectGender==Gender.female?activeCard:inactiveCard,
                  childCard:IconContent(text: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                  ),
               ),
                ),
              ),
            ],
           ),
          ),

          Expanded(child:
          ReusableCard(
            colour: activeCard,
            childCard: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("HEIGHT",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Color(0xFF8D8E98),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(),
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.w900,
                    ),
                    ),
                    const Text("CM",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFF8D8E98),
                    ),
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: const Color(0xFFEB1555),
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                    overlayColor: const Color(0x29EB1555),
                  ),
                  child: Slider(
                    //A slider in Flutter is a material design widget used for selecting a range of values.
                    //It is an input widget where we can set a range of values by dragging or pressing on the desired position.
             // properties of slider are
                  value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      inactiveColor:  const Color(0xFF8D8E98),
                      onChanged: (double newValue){
                        setState(() {
                          height=newValue.round();
                        });
                      }
                  ),
                )
              ],
            ),
          )
          ),
          Expanded(child:
          Row(
            children: [
              Expanded(child: ReusableCard(
                colour: activeCard,
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("WEIGHT",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF8D8E98),

                      ),
                    ),
                    Text(weight.toString(),
                      style: const TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                          onPressed: (){
                          setState(() {
                            weight--;
                          });
                          },
                        ),
                        const SizedBox(
                          height: 15.0,
                          width: 10.0,

                        ),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                        onPressed: (){
                          setState(() {
                            weight++;
                          });
                        },
                        ),
                      ],
                    ),

                  ],
                ),
              )
              ),
              Expanded(child:
                  ReusableCard(
                    colour: activeCard,
                     childCard: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         const Text("AGE",
                         style: TextStyle(
                           fontSize: 18.0,
                           color: Color(0xFF8D8E98),

                         ),
                         ),
                         Text(age.toString(),
                         style: const TextStyle(
                           fontSize: 50.0,
                           fontWeight: FontWeight.w900,

                         ),
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             RoundIconButton(onPressed: (){
                               setState(() {
                                 age--;
                               });
                             },
                                 icon: FontAwesomeIcons.minus,
                             ),
                             const SizedBox(
                               width: 10.0,
                             ),
                             RoundIconButton(onPressed: (){
                               setState(() {
                                 age++;
                               });
                             }, icon: FontAwesomeIcons.plus)
                           ],
                         )
                       ],


                     ),
                  ),
              ),
            ],
           ),
          ),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => resultPage(
                bmiResult: calc.calculateBmi(),
                resultInterpretation: calc.getInterpretation(),
                resultText: calc.getResult(),
              ),),);
            },
            child: Container(
              child: const Center(
                child: Text('CALCULATE',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              color: bottomContainerColour,
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
    RoundIconButton({ required this.onPressed, required this.icon});

   final IconData icon;
   final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),

    );
  }
}
