import 'package:flutter/material.dart';

class SlidePageRoute extends PageRouteBuilder {
  final Widget _child;
  SlidePageRoute(this._child)
      : super(
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext _context, 
              Animation <double> animation,
              Animation secondAnimation, Widget child) {
            var slideAnimation =
                Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
                    .animate(animation);
            return SlideTransition(
              position: slideAnimation,
              child: child,
            );
          },
          pageBuilder: (BuildContext _context, animation, secondAnimation) {
            return _child;
          },
        );
}
