import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'question_handler.dart';
import 'screens/quiz_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<QuestionHandler>(
      create: (context)=> QuestionHandler(),
      child: MaterialApp(
         home: QuizScreen(),
      ),
    );
  }
}

