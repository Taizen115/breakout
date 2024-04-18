import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/flame/brick_breaker.dart';
import 'package:game/flame/utils/config.dart';
import 'package:game/widgets/components/score_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final BrickBreaker game;

  @override
  void initState() {
    super.initState();
    game = BrickBreaker();
  }

  //TODO ゲームの装飾を付ける
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: ScoreCard(score: game.score),
            ),
            Expanded(
              child: Center(
                child: FittedBox(
                  child: SizedBox(
                    width: gameWidth,
                    height: gameHeight,
                    child: GameWidget(
                      game: game,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _createWelcomeOverlay(BuildContext context) {
    return Center(
      child: Text(
        "ボタン押したら、ゲーム始まるでー(*‘ω‘ *)",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }

  Widget _createGameOverOverlay(BuildContext context) {
    return Center(
      child: Text(
        "あー、もう少しがんばりー",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }

  Widget _createWonOverOverlay(BuildContext context) {
    return Center(
      child: Text(
        "ゲームクリア！おつかれさんです🍵",
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}
