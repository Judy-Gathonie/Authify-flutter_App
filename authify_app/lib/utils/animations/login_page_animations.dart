import 'package:flutter/material.dart';


class EnterAnimation {
  late Animation<double> circlesize;
  AnimationController controller;
  
  EnterAnimation(this.controller) {
    circlesize = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOutBack),
    );
  }
}