import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz_widget/quiz_widget.dart';
import 'package:DevQuiz/home/widget/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SafeArea(
            child: QuestionIndicatorWidget(),
          ),
        ),
      ),
      body: Container(
        child: QuizWidget(
          title: "O que o Flutter faz em sua totalidade?",
        ),
      ),
    );
  }
}
