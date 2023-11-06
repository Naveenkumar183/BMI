import 'package:flutter/material.dart';
import 'Reusable_card.dart';
import 'global file.dart';

class ResultPage extends StatelessWidget {
  ResultPage({required this.interpretation,required this.bmiResult,required this.resultText});

  final String interpretation;
  final String bmiResult;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('BMI CALCULATOR'),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          Expanded(child:Container(
            padding: EdgeInsets.all(15.0),
            alignment:Alignment.bottomLeft,
            child:Text("Your Result",
            style:TextStyle(
              fontSize:50.0,
              fontWeight:FontWeight.bold,
            ),),
          ),
          ),
          Expanded(
            flex:5,
            child:Refactorcode(
              colour:kActivecardcolor,
              cardchild:Column(
                mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                   Text(
                     resultText.toUpperCase(),
                     style:TextStyle(
                       color:Color(0xFF24D876),
                       fontSize:22.0,
                       fontWeight:FontWeight.bold
                     ),
                   ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize:100.0,
                      fontWeight:FontWeight.bold
                    ),
                  ),
                    Text(
                      interpretation,
                        textAlign:TextAlign.center,
                        style:TextStyle(

                            fontSize:22.0,
                          )

                  )
                ],
              ),
            )
          ),
          GestureDetector(
            onTap:(){
            Navigator.pop(context);
            },
            child:Container(
                child:Center(
                  child: Text(
                    'RE_CALCULATE',
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
