import 'package:authify_app/utils/animations/login_page_animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedHomePageState();
  }
}

class _AnimatedHomePageState extends State<AnimatedHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        reverseDuration: Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    //implement dispose for _controller function
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _HomePage(controller);
  }
}

class _HomePage extends StatelessWidget {
  late double _deviceHeight;
  late double _deviceWidth;
  Color _primaryColor = Color.fromRGBO(169, 224, 241, 1.0);

  AnimationController controller;
  late EnterAnimation _animation;

  _HomePage(this.controller) {
    _animation = EnterAnimation(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            height: _deviceHeight * 0.60,
            width: _deviceWidth,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _avatarWidget(),
                  SizedBox(
                    height: _deviceHeight * 0.03,
                  ),
                  _nameWidget(),
                  SizedBox(
                    height: _deviceHeight * 0.2,
                  ),
                  _logoutButton(context),
                ]),
          ),
        ));
  }

  Widget _avatarWidget() {
    double _circleD = _deviceHeight * 0.25;
    return AnimatedBuilder(
      animation: _animation.controller,
      builder: (BuildContext context, Widget? child) {
        return Transform(
          transform:  Matrix4.diagonal3Values(
              _animation.circlesize.value, _animation.circlesize.value, 1),
          child: Container(
            height: _circleD,
            width: _circleD,
            decoration: BoxDecoration(
                color: _primaryColor,
                borderRadius: BorderRadius.circular(500),
                image: DecorationImage(
                    image: AssetImage('asssets/images/main_avatar.png'))),
          ),
        );
      },
    );
  }

  Widget _nameWidget() {
    return Container(
      child: Text(
        "Judy Gathoni",
        style: TextStyle(
            color: _primaryColor, fontSize: 35, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _logoutButton(BuildContext _context) {
    return MaterialButton(
        minWidth: _deviceWidth * 0.38,
        height: _deviceHeight * 0.055,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: BorderSide(color: _primaryColor, width: 3)),
        child: Text(
          "Log Out",
          style: TextStyle(
              fontSize: 16, color: _primaryColor, fontWeight: FontWeight.bold),
        ),
        onPressed: () {});
  }
}
