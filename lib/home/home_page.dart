import 'package:DevQuiz/home/widget/appBar/app_bar_widget.dart';
import 'package:DevQuiz/home/widget/level_button/level_button_widget.dart';
import 'package:DevQuiz/home/widget/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LevelButtonWidget(
                  label: 'Fácil',
                ),
                LevelButtonWidget(
                  label: 'Médio',
                ),
                LevelButtonWidget(
                  label: 'Difícil',
                ),
                LevelButtonWidget(
                  label: 'Perito',
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
