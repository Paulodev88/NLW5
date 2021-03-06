import 'package:flutter/material.dart';
import 'package:nlw/challenge/challenge_page.dart';
import 'package:nlw/core/core.dart';
import 'package:nlw/home/home_controller.dart';
import 'package:nlw/home/home_state.dart';
import 'package:nlw/home/widgets/appbar/app_bar_widgets.dart';
import 'package:nlw/home/widgets/level_button/level_button_widget.dart';
import 'package:nlw/home/widgets/quiz_card/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LevelButtonWidget(label: "Fácil"),
                  LevelButtonWidget(label: "Médio"),
                  LevelButtonWidget(label: "Difícil"),
                  LevelButtonWidget(label: "Perito"),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children: controller.quizzes!
                    .map((e) => QuizCardWidget(
                          image: e.imagem,
                          title: e.title,
                          percent: e.questionAnswered / e.questions.length,
                          completed:
                              "${e.questionAnswered} de ${e.questions.length}",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChallengePage(
                                          questions: e.questions,
                                          title: e.title,
                                        )));
                          },
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen)),
        ),
      );
    }
  }
}
