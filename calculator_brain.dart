import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;

  double _bmi=18.5;
  String calculateBmi(){
      _bmi= weight/(pow(height/100, 2));
      return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if(_bmi>=25) {
      return 'OverWeight';
    } else if(_bmi>18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }
  String getInterpretation(){
    if(_bmi>=25) {
      return 'You have higher weight than Normal body weight. Try to Exercise More ';
    } else if(_bmi>18.5) {
      return 'You have a Normal body weight ! Good Job';
    } else {
      return 'You have a lower weight than normal weight. Try to eat little bit more';
    }
  }

}