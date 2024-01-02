import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScoreComponent extends PositionComponent {
  late TextPainter textPainter;
  late TextStyle textStyle;
  late int score;

  ScoreComponent(this.score) {
    textStyle = TextStyle(color: Colors.white, fontSize: 12);
    textPainter = TextPainter(
      text: TextSpan(text: 'Score: $score', style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout();
  }

  void updateScore(int newScore) {
    score = newScore;
    textPainter.text = TextSpan(text: 'Score: $score', style: textStyle);
    textPainter.layout();
  }

  @override
  void render(Canvas canvas) {
    textPainter.paint(canvas, Offset(5, 20));
  }

  @override
  void update(double dt) {}
}
