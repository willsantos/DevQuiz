import 'package:flutter/material.dart';

import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator_widget/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.totalPages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $currentPage",
                style: AppTextStyles.body,
              ),
              Text(
                "de $totalPages",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          ProgressIndicatorWidget(value: currentPage / totalPages)
        ],
      ),
    );
  }
}
