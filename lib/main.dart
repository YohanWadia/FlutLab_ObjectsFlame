import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'MyBall.dart';

void main() {
  runApp(GameWidget(game: BouncingBallsGame()));
}

class BouncingBallsGame extends FlameGame with TapCallbacks {
  //method to preLoad stuff===========
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    //=====================================
    //pass radius,color,moving | position,anchor
    MyBall firstBall = MyBall(
      24.0,
      Colors.cyanAccent,
      50.0,
      Vector2(size.x / 2, size.y / 2),
      Anchor.center,
    );
    //=====================================

    add(firstBall); // Add the object to your game
  }

  //=========================

  //method to detect mouse =================
  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    //=====================================
    //pass radius,color,moving | position,anchor
    MyBall newBall = MyBall(
      10.0,
      Colors.red,
      100.0,
      event.localPosition.clone(),
      Anchor.center,
    );
    //==================================

    // Add the newball object to your game
    add(newBall);
  }
}
