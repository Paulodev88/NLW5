import 'package:flutter/material.dart';
import 'package:nlw/challenge/widgets/awnser/awnser_widget.dart';
import 'package:nlw/core/core.dart';
import 'package:nlw/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  awnser(int index) => widget.question.awnsers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: 34,
        ),
        Text(
          widget.question.title,
          style: AppTextStyles.heading,
        ),
        SizedBox(height: 24),
        for (var i = 0; i < widget.question.awnsers.length; i++)
          AwnserWidget(
            anwser: awnser(i),
            disable: indexSelected != -1,
            isSelected: indexSelected == i,
            onTap: () {
              indexSelected = i;

              Future.delayed(Duration(seconds: 1))
                  .then((value) => widget.onChange());
              setState(() {});
            },
          ),
      ],
    ));
  }
}
