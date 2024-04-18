import 'package:flutter/material.dart';

class ScoreCard extends StatelessWidget {
  final ValueNotifier<int> score;

  const ScoreCard({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    //ValueListenableBuilderは、変更の数値を受けられるよーという意味で使ってる
    return ValueListenableBuilder(
      valueListenable: score,
      builder: (context, score, child) {
        return Text(
          "Score: $score".toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        );
      },
    );
  }
}
