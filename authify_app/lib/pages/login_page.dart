import 'package:authify_app/utils/animations/login_page_animations.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';
import '../utils/animations/login_page_animations.dart';
import '../utils/animations/page_routes/fade_page_route.dart';

class AnimatedLoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AnimatedLoginPageState();
  }
}

class _AnimatedLoginPageState extends State<AnimatedLoginPage>
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
    return _loginPage(controller);
  }
}

class _loginPage extends StatelessWidget {
  late double _deviceHeight;
  late double _deviceWidth;

  Color _primaryColor = Color.fromRGBO(125, 191, 211, 1.0);

  Color _secondaryColor = Color.fromRGBO(169, 224, 241, 1.0);

  late EnterAnimation _animation;
  late AnimationController controller;
  _loginPage(this.controller) {
    controller = controller;
    _animation = EnterAnimation(controller);
    controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: _primaryColor,
        body: Align(
            alignment: Alignment.center,
            child: Container(
              height: _deviceHeight * 0.60,
              width: _deviceWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _avatarWidget(),
                  SizedBox(
                    height: _deviceHeight * 0.05,
                  ),
                  _emailTextField(),
                  _PasswordTextField(),
                  SizedBox(
                    height: _deviceHeight * 0.10,
                  ),
                  _loginButton(context),
                ],
              ),
            )));
  }

  Widget _avatarWidget() {
    double _circleD = _deviceHeight * 0.25;
    return AnimatedBuilder(
      animation: _animation.controller,
      builder: (BuildContext context, Widget? child) {
        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.diagonal3Values(
              _animation.circlesize.value, _animation.circlesize.value, 1),
          child: Container(
            height: _circleD,
            width: _circleD,
            decoration: BoxDecoration(
                color: _secondaryColor,
                borderRadius: BorderRadius.circular(500),
                image: DecorationImage(
                    image: AssetImage('asssets/images/main_avatar.png'))),
          ),
        );
      },
    );
  }

  Widget _emailTextField() {
    return Container(
        width: _deviceWidth * 0.70,
        child: TextField(
          cursorColor: Colors.white,
          autocorrect: false,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Judy.g@gmail.com",
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
          ),
        ));
  }

  Widget _PasswordTextField() {
    return Container(
        width: _deviceWidth * 0.70,
        child: TextField(
          obscureText: true,
          cursorColor: Colors.white,
          autocorrect: false,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
          ),
        ));
  }

  Widget _loginButton(BuildContext _context) {
    return MaterialButton(
      minWidth: _deviceWidth * 0.38,
      height: _deviceHeight * 0.055,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(color: Colors.white)),
      onPressed: () async {
        await controller.reverse();
        Navigator.pushReplacement(_context, FadePageRoute(AnimatedHomePage()));
      },
      child: Text(
        "Log In",
        style: TextStyle(
            fontSize: 16, color: _primaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
