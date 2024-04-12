import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/flame/brick_breaker.dart';
import 'package:game/flame/utils/config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  //TODO ゲームの装飾を付ける
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FittedBox(
          child: SizedBox(
            width: gameWidth,
            height: gameHeight,
            child: GameWidget.controlled(
              gameFactory: BrickBreaker.new,
              overlayBuilderMap: {
                PlayStatus.welcome.name: (context, game) =>
                    _createWelcomeOverlay(context),
                PlayStatus.gameOver.name: (context, game) =>
                    _createGameOverOverlay(context),
                PlayStatus.won.name: (context, game) =>
                    _createWonOverOverlay(context),
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _createWelcomeOverlay(BuildContext context) {
    return Center(
      child: Text(
        "ボタンを押して、レッツプレイ！",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }

  Widget _createGameOverOverlay(BuildContext context) {
    return Center(
      child: Text(
        "ゲームオーバー⤵　再チャレンジ求む",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }

  Widget _createWonOverOverlay(BuildContext context) {
    return Center(
      child: Text(
        "ゲームクリア⤴　アゲアゲー🤩",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
