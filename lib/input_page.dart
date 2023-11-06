import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Icon_content.dart';
import 'Reusable_card.dart';
import 'global file.dart';
import 'result.dart';
import 'BMI_BRAIN.dart';
enum Gender{
  Male,Female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selected;
  int height=180;
  int weight=60;
  int age=19;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),

        centerTitle: true,
      ),
      body:Column(
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          Expanded(child:Row(
            children: [
              Expanded(

                  child:Refactorcode(
                     onPress:(){
                       setState(() {
                         selected=Gender.Male;
                       });
                  },
                    colour:selected==Gender.Male?kActivecardcolor:kInactivecardcolor,
                    cardchild:Custom(str:'MALE',icon:FontAwesomeIcons.mars)
                  ),
              ),
              Expanded(child:Refactorcode(
                onPress:(){
                  setState(() {
                    selected=Gender.Female;
                  });
                },
                  colour:selected==Gender.Female?kActivecardcolor:kInactivecardcolor,
                cardchild:Custom(str:'FEMALE',icon:FontAwesomeIcons.venus),
              ),
              )
            ],
          ),
          ),
          Expanded(child:Refactorcode(
              colour:selected==Gender.Male || selected==Gender.Female?kActivecardcolor:kInactivecardcolor,
              cardchild:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style:labelone,
                  ),

                  Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    crossAxisAlignment:CrossAxisAlignment.baseline,
                    textBaseline:TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style:kmiddlebox
                      ),
                      Text(
                        'cm',
                         style:labelone
                      )
                    ],
                  ),
                  SliderTheme(
                    data:SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      thumbShape:RoundSliderThumbShape(enabledThumbRadius:15.0),
                      overlayShape:RoundSliderOverlayShape(overlayRadius: 30.0),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor:Color(0x29EB1555)
                    ),
                    child: Slider(

                      value:height.toDouble(),
                      min:120.0,
                      max:220.0,


                      inactiveColor:Color(0xFF8D8E98),
                      onChanged:(double newValue ){
                        setState(() {
                          height=newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),

          ),
          ),
          Expanded(child:Row(
            children: [
              Expanded(child:Refactorcode(
                  colour:kInactivecardcolor,
                  cardchild:Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style:labelone
                      ),
                      Text(
                        weight.toString(),
                        style:kmiddlebox,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(child:FontAwesomeIcons.plus,
                            naveen:(){
                              setState(() {
                                weight=weight+1;
                              });
                            },),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIcon(child:FontAwesomeIcons.minus,
                            naveen:(){
                              setState(() {
                                if(weight>60){
                                  weight=weight-1;
                                }

                              });
                            },)

    ]
                      )
                    ],
                )

              )),
              Expanded(child:Refactorcode(
                  colour:kInactivecardcolor,
                cardchild:Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    Text(
                        "AGE",
                        style:labelone
                    ),
                    Text(
                      age.toString(),
                      style:kmiddlebox,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIcon(child:FontAwesomeIcons.plus,
                            naveen:(){
                              setState(() {
                                age=age+1;
                              });
                            },),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIcon(child:FontAwesomeIcons.minus,
                            naveen:(){
                              setState(() {

                                  age=age-1;


                              });
                            },)

                        ]
                    )
                  ],
                )
                ,
              ),
              )
            ],
          ),),
          GestureDetector(
            onTap:(){
              CaluculatorBrain calc=new CaluculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>ResultPage(
                    interpretation:calc.getInterpretation(),
                    bmiResult:calc.caluclatorBMI(),
                    resultText:calc.getResult()


                )),
              );
            },
            child:Container(
                child:Center(
                  child: Text(
                    'CALCULATE',
                    style:TextStyle(
                      fontSize:25.0,
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                ),
                color:Color(0xFFEB1555),
                margin:EdgeInsets.only(top:10.0),
                width:double.infinity,
                height:kBottomcontainer
            ),
          )
        ],
      )

    );
  }
}


class RoundIcon extends StatelessWidget {
   final IconData child;
 final Function naveen;
   RoundIcon({required this.child,required this.naveen});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child:Icon(
        child,
        color:Colors.white,
      ),
      elevation:6.0,
      constraints:BoxConstraints.tightFor(
        width:56.0,
        height:56.0
      ),
      fillColor:Color(0xFF4C4F5E),
      shape: CircleBorder(),
      onPressed:(){
        naveen();
      },
    );
  }
}


