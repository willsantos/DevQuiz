import 'package:DevQuiz/home/home_page.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int total;
  final int result;
  const ResultPage({
    Key? key,
    required this.title,
    required this.total,
    required this.result,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns!",
                  style: AppTextStyles.heading40,
                ),
                Text.rich(
                  TextSpan(
                    text: "\nVocê concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\n$title",
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: "\ncom $result de $total acertos.",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 68, vertical: 15),
                      child: NextButtonWidget.purple(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                'Eita acertei $result de $total no devQuiz, consegue ser melhor ? https://devquiz.example.com');
                          }),
                    )),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 68),
                      child: NextButtonWidget.white(
                          label: "Voltar ao ínicio",
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }),
                    )),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
