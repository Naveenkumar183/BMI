import 'dart:math';

class CaluculatorBrain{
  final int weight;
  final int height;
  CaluculatorBrain({required this.height,required this.weight});

 double _res=0.0;
  String caluclatorBMI(){
     _res=weight/pow(height/100,2);
    return _res.toStringAsFixed(1);
  }
  String getResult(){
    if(_res>=25){
      return 'OverWeight';
    }else if(_res>18.5){
      return "Normal";
    }else{
      return "UnderWeight";
    }
  }
  String getInterpretation(){
    if(_res>=25){
      return 'You have a higher than normal body weight,Try to exercisemore';
    }else if(_res>18.5){
      return "You are a normal body weight.Good job";
    }else{
      return "You have a lower than normal body weight.You can eat a bit more";
    }
  }
}
