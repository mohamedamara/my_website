import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mohamed Amara',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller;
  int _selectedLink = 0;
  var _screenHeight;

  _scrollTo({double offset, int selectedLink}) {
    _controller.animateTo(
      offset,
      curve: Curves.linear,
      duration: Duration(milliseconds: 500),
    );
    setState(() {
      _selectedLink = selectedLink;
    });
  }

  _scrollListener() {
    if (_controller.offset < _screenHeight &&
        !_controller.position.outOfRange) {
      setState(() {
        _selectedLink = 0;
      });
    }
    if (_controller.offset > _screenHeight &&
        !_controller.position.outOfRange) {
      setState(() {
        _selectedLink = 1;
      });
    }
    if (_controller.offset > _screenHeight * 2 &&
        !_controller.position.outOfRange) {
      setState(() {
        _selectedLink = 2;
      });
    }
    if (_controller.offset > _screenHeight * 3 &&
        !_controller.position.outOfRange) {
      setState(() {
        _selectedLink = 3;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: <Widget>[
          Container(
            width: 272,
            color: const Color(0xFFbd5d38),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 100,
                ),
                Container(
                  height: 162,
                  width: 162,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 8,
                      color: const Color(0xFFffffff).withOpacity(.2),
                    ),
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Container(
                      height: 145,
                      width: 145,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("avataaars.png"),
                        ),
                        color: const Color(0xFFffffff).withOpacity(.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 20),
                  child: GestureDetector(
                    onTap: () => _scrollTo(offset: 0, selectedLink: 0),
                    child: Text(
                      "ABOUT",
                      style: TextStyle(
                        fontFamily: "Muli-ExtraBold",
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: _selectedLink == 0
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () =>
                        _scrollTo(offset: _screenHeight + 0.5, selectedLink: 1),
                    child: Text(
                      "EDUCATION",
                      style: TextStyle(
                        fontFamily: "Muli-ExtraBold",
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: _selectedLink == 1
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () => _scrollTo(
                        offset: _screenHeight * 2 + 1, selectedLink: 2),
                    child: Text(
                      "PROJECTS",
                      style: TextStyle(
                        fontFamily: "Muli-ExtraBold",
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: _selectedLink == 2
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: GestureDetector(
                    onTap: () => _scrollTo(
                        offset: _screenHeight * 3 + 1.5, selectedLink: 3),
                    child: Text(
                      "SKILLS",
                      style: TextStyle(
                        fontFamily: "Muli-ExtraBold",
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                        color: _selectedLink == 3
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: ListView(
                controller: _controller,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 130, left: 50, right: 45),
                    height: _screenHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: 'MOHAMED ',
                            style: TextStyle(
                              color: const Color(0xFF343a40),
                              height: 0.9,
                              fontFamily: "SairaExtraCondensed-Bold",
                              fontSize: 95,
                              fontWeight: FontWeight.w700,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'AMARA',
                                style: TextStyle(
                                  color: const Color(0xFFbd5d38),
                                  height: 0.9,
                                  fontFamily: "SairaExtraCondensed-Bold",
                                  fontSize: 95,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'ANNABA, ALGERIA ',
                            style: TextStyle(
                              color: const Color(0xFF868e96),
                              fontFamily: "SairaExtraCondensed-Medium",
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'CONTACT@MOHAMEDAMARA.ME',
                                style: TextStyle(
                                  color: const Color(0xFFbd5d38),
                                  fontFamily: "SairaExtraCondensed-Medium",
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do" 
                          "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim" 
                          "ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut" 
                          "aliquip ex ea commodo consequat.",
                          style: TextStyle(
                            height: 1.5,
                            color: const Color(0xFF868e96),
                            fontFamily: "Muli-Regular",
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.all(16),
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF495057),
                              ),
                              child: Center(
                                child: Image(
                                  image: AssetImage("logo/linkedin-logo.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF495057),
                              ),
                              child: Center(
                                child: Image(
                                  image: AssetImage("logo/github-logo.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF495057),
                              ),
                              child: Center(
                                child: Image(
                                  image: AssetImage(
                                      "logo/twitter-logo-silhouette.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              height: 55,
                              width: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xFF495057),
                              ),
                              child: Center(
                                child: Image(
                                  image: AssetImage(
                                      "logo/facebook-letter-logo.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: const Color(0xFF868e96).withOpacity(0.5),
                    height: 0.4,
                  ),
                  Container(
                    height: _screenHeight,
                    child: Center(
                      child: Text(
                        "COMING SOON ...",
                        style: TextStyle(
                            color: const Color(0xFF343a40),
                            fontSize: 95,
                            fontFamily: "SairaExtraCondensed-Bold",
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Container(
                    color: const Color(0xFF868e96).withOpacity(0.5),
                    height: 0.4,
                  ),
                  Container(
                    height: _screenHeight,
                    child: Center(
                      child: Text(
                        "COMING SOON ...",
                        style: TextStyle(
                            color: const Color(0xFF343a40),
                            fontSize: 95,
                            fontFamily: "SairaExtraCondensed-Bold",
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Container(
                    color: const Color(0xFF868e96).withOpacity(0.5),
                    height: 0.4,
                  ),
                  Container(
                    height: _screenHeight,
                    child: Center(
                      child: Text(
                        "COMING SOON ...",
                        style: TextStyle(
                            color: const Color(0xFF343a40),
                            fontSize: 95,
                            fontFamily: "SairaExtraCondensed-Bold",
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
