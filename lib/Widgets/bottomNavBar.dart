import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_up_live/Presenter/PullUpLiveProvider.dart';

import '../Utility/ColorTheme.dart';

int bottomSelectedIndex = 0;

Widget bottomBar(BuildContext context, PullUpLiveProvider provider) {
  return Container(
    height: 73,
    child: BottomNavigationBar(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      currentIndex: provider.currentIndex, //New
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context).pushNamed('/matchedProfiles');
        } else if (index == 1) {
          Navigator.of(context).pushNamed('/followingScreen');
        } else if (index == 2) {
          Navigator.of(context).pushNamed('/messageScreen');
        } else if (index == 3) {}
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/home-1.png"),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/sedan-car.svg"),
          label: 'Car',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset("assets/images/envelope.svg"),
          label: 'Message',
        ),
        BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/user-1.svg"),
            label: 'Profile'),
      ],
    ),
  );
}

Widget profileBottomBar(BuildContext context, PullUpLiveProvider provider) {
  return Container(
    height: 60,
    width: 414,
    color: Colors.white,
    child: BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      currentIndex: provider.currentIndex, //New
      onTap: (index) {
        if (index == 0) {
          // Navigator.of(context).pushNamed('/dashboard');
        } else if (index == 1) {
        } else if (index == 2) {}
      },
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:
              Image.asset("assets/images/Close_SM/drawable-hdpi/Close_SM.png"),
          label: 'Close',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/images/heart.svg",
            height: 20,
            width: 20,
          ),
          label: 'Heart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/images/Message.svg",
            height: 20,
            width: 20,
          ),
          label: 'Message',
        ),
      ],
    ),
  );
}
