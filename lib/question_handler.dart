import 'package:flutter/material.dart';
import 'models/question.dart';

class QuestionHandler extends ChangeNotifier{

  final List<Question> _questionList = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was "Moon".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question('No piece of square dry paper can be folded in half more than 7 times.', false),
    Question('In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
    Question('The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    Question('The total surface area of two human lungs is approximately 70 square metres.', true),
    Question('Google was originally called "Backrub".', true),
    Question('Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
    Question('In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
  ];

  int _questionNo = 0;
  final List<Icon> _scoreKeeper = [];
  bool _showReset = false;
  int _correctAnswers = 0;

  Question get currentQuestion {
    return _questionList[_questionNo];
  }

  List<Icon> get scoreKeeper{
    return _scoreKeeper;
  }

  bool get showReset{
    return _showReset;
  }

  String get marks{
    return "$_correctAnswers out of ${_questionList.length.toString()}";
  }

  void _nextQuestion(){
    if(_questionNo < _questionList.length - 1){
      _questionNo++;
    }
    else{
      _showReset = true;
    }
  }

  void checkAnswer(bool givenAnswer){
    if(_questionNo < _questionList.length){
      if(_questionList[_questionNo].answer == givenAnswer){
        _scoreKeeper.add(Icon(Icons.check, color: Colors.green));
        _correctAnswers++;
      }
      else{
        _scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
      _nextQuestion();
    }

    notifyListeners();
  }

  void reset(){
    _questionNo = 0;
    _correctAnswers = 0;
    _scoreKeeper.clear();
    _showReset = false;
    notifyListeners();
  }


}
