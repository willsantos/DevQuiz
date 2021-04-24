import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz_widget/quiz_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;
  final int total;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.title,
    required this.total,
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

  void onSelected(bool value) {
    if (value) {
      controller.corretAnswers++;
    }
    nextPage();
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
                onSelected: onSelected,
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

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                    title: widget.title,
                                    total: widget.questions.length,
                                    result: controller.corretAnswers,
                                  )));
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
