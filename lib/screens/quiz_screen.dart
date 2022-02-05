import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../question_handler.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final questionHandler = Provider.of<QuestionHandler>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              Expanded(
                flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                          questionHandler.showReset ? "Your marks are ${questionHandler.marks}" : questionHandler.currentQuestion.question,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.white)
                      ),
                    ),
                  )
              ),

              if(!questionHandler.showReset)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text('True', style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: ()=>questionHandler.checkAnswer(true),
                  ),
                ),
              ),
              if(!questionHandler.showReset)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,15,30),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text('False', style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: ()=>questionHandler.checkAnswer(false),
                  ),
                ),
              ),
              if(questionHandler.showReset)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,15,30),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text('Reset', style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: ()=>questionHandler.reset(),
                  ),
                ),
              ),
              Wrap(children: questionHandler.scoreKeeper),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
