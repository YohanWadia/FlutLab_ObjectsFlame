import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'main.dart';

//the object will be created out of this MyBall class
class MyBall extends PositionComponent
    with HasGameReference<BouncingBallsGame> {
  double radius;
  Color myColor;
  double moveX;
  Paint paintColor = Paint();

  MyBall(this.radius, this.myColor, this.moveX, Vector2 position, Anchor anchor)
      : super(position: position, anchor: anchor);

  @override
  void update(double dt) {
    super.update(dt);
    position.x = position.x + (moveX * dt);
    //boundaryWork();
  }

  void boundaryWork() {
    final maxX = game.size.x;

    // Hit right edge -> reverse direction & double scale
    if (position.x > maxX) {
      position.x = maxX;
      moveX = -moveX;
      //scale = scale * 2.0;
    }

    // Hit left edge -> reverse direction & halve scale
    if (position.x < 0) {
      position.x = 0;
      moveX = -moveX;
      //scale = scale * 0.5;
    }
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    paintColor.color = myColor;
    canvas.drawCircle(Offset.zero, radius, paintColor);
  }
}
