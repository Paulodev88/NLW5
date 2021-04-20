import 'package:flutter/material.dart';
import 'package:nlw/core/app_gradients.dart';
import 'package:nlw/core/app_text_styles.dart';
import 'package:nlw/home/widgets/score_card/scrore_card_widget.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget()
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 161,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    width: double.maxFinite,
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(
                              text: "Olá,",
                              style: AppTextStyles.title,
                              children: [
                                TextSpan(
                                    text: " Paulo Ricardo",
                                    style: AppTextStyles.titleBold)
                              ])),
                          Container(
                            width: 58,
                            height: 58,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://avatars.githubusercontent.com/u/71569906?s=400&u=18239a55274560325dc966b42e268527f3c56c82&v=4"))),
                          ),
                        ]),
                  ),
                  Align(
                      alignment: Alignment(0.0, 1.0), child: ScoreCardWidget()),
                ],
              ),
            ));
}
