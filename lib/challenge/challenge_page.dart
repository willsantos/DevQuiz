import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz_widget/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void nextPage() {
    if (controller.currentPage < widget.questions.length) {
      pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(94),
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    currentPage: value,
                    totalPages: widget.questions.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map(
              (e) => QuizWidget(
                question: e,
                onChange: () {
                  nextPage();
                },
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: NextButtonWidget.white(
                label: "Pular",
                onTap: () {
                  nextPage();
                },
              )),
              SizedBox(width: 7),
              Expanded(
                  child: ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => NextButtonWidget.green(
                  label: "confirmar",
                  onTap: () {
                    if (value == widget.questions.length) {
                      //TODO Implementar modificação da tela com confirmar em cada pergunta.

                      print("ACABOU!");
                    } else {
                      nextPage();
                    }
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
