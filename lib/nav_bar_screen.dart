
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funsol_test/prompt_screen.dart';
import 'package:funsol_test/theme/app_theme.dart';
import 'package:funsol_test/theme/text_style_theme.dart';


class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key});

  @override
  State<NavBarPage> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBarPage> {
  int selectedTab = 0;
  DateTime? currentBackPressTime;
  PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      initializeComponent();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  _changeTab(int index) {
    setState(() {
      selectedTab = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 200), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 60,
        shape: const CircularNotchedRectangle(),
        color: Colors.white,
        notchMargin: 8,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _changeTab(0);
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/prompt.svg",
                        width: 20,
                        color: selectedTab == 0
                            ? primaryColor
                            : Colors.grey,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Prompt",
                        style: selectedTab == 0
                            ? primaryRegularIn12px()
                            : greyRegularIn12px(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _changeTab(1);
                },
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Image.svg",
                        width: 20,
                        color: selectedTab == 1
                            ? primaryColor
                            : Colors.grey,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Image",
                        style: selectedTab == 1
                            ? primaryRegularIn12px()
                            : greyRegularIn12px(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _changeTab(2);
                },
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Right-position.svg",
                        width: 15,
                        color: selectedTab == 2
                            ? primaryColor
                            : Colors.grey,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Saved",
                        style: selectedTab == 2
                            ? primaryRegularIn12px()
                            : greyRegularIn12px(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _changeTab(3);
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/crown.svg",
                        width: 20,
                        color: selectedTab == 3
                            ? primaryColor
                            : Colors.grey,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Premium",
                        style: selectedTab == 3
                            ? primaryRegularIn12px()
                            : greyRegularIn12px(),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  _changeTab(4);
                },
                child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Setting.svg",
                        width: 20,
                        color: selectedTab == 4
                            ? primaryColor
                            : Colors.grey,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Settings",
                        style: selectedTab == 4
                            ? primaryRegularIn12px()
                            : greyRegularIn12px(),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            PromptPage(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }

  initializeComponent() async {}

}
