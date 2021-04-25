import 'package:flutter/foundation.dart';
import 'package:nlw/home/home_repository.dart';
import 'package:nlw/home/home_state.dart';

import 'package:nlw/shared/models/quiz_model.dart';
import 'package:nlw/shared/models/user_model.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user; // Can be null.
  List<QuizModel>? quizzes; // Can be null.

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
