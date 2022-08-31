import 'package:flutter/material.dart';
import 'package:flutterapp/main_screen.dart';
import 'package:flutterapp/constants.dart';
import 'package:flutterapp/ui/icomoon_icons.dart';

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabPages = <Widget>[
      const MainScreenPage(),
      const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
      const Center(child: Icon(Icons.forum, size: 64.0, color: Colors.blue)),
    ];
    final bottmonNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Icon(
              IcoMoonIcons.home_rectangle,
              size: 20,
              color: AppColors.textWhiteColor,
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Icon(
              IcoMoonIcons.home_rectangle,
              size: 20,
              color: AppColors.textWhiteColor,
            ),
          ),
          label: '',
          backgroundColor: Colors.blue),
      const BottomNavigationBarItem(
          activeIcon: Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Icon(
              IcoMoonIcons.burger,
              size: 20,
              color: AppColors.textWhiteColor,
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Icon(
              IcoMoonIcons.burger,
              size: 20,
              color: AppColors.textWhiteColor,
            ),
          ),
          label: '',
          backgroundColor: Colors.black),
      const BottomNavigationBarItem(
          icon: _BadgedIcon(badgeText: '2'),
          activeIcon: _BadgedIcon(badgeText: '2'),
          label: '',
          backgroundColor: Colors.black),
    ];
    assert(tabPages.length == bottmonNavBarItems.length);

    final themeData = ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.dateBackgroundBlackColor,
        elevation: 0,
        selectedLabelStyle: const TextStyle(
          color: Color(0xFFA67926),
          fontFamily: FontFamilies.matterFontFamily,
          fontSize: 14.0,
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey[600],
          fontFamily: FontFamilies.matterFontFamily,
          fontSize: 12.0,
        ),
        selectedItemColor: const Color(0xFFA67926),
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
      ),
    );

    final bottomNavBar = BottomNavigationBar(
      fixedColor: Colors.black,
      items: bottmonNavBarItems,
      currentIndex: _currentTabIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );

    final theme = Theme(
      data: themeData,
      child: bottomNavBar,
    );

    return Scaffold(
      body: tabPages[_currentTabIndex],
      bottomNavigationBar: theme,
    );
  }
}

class _BadgedIcon extends StatelessWidget {
  final String badgeText;
  const _BadgedIcon({
    Key? key,
    required this.badgeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          const Icon(
            IcoMoonIcons.bell,
            size: 20,
            color: AppColors.textWhiteColor,
          ),
          Positioned(
            left: 10,
            top: -10,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.popOrange,
                borderRadius: BorderRadius.circular(8),
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  badgeText,
                  style: AppTextStyles.mediumStyle(context)?.copyWith(
                    color: AppColors.textWhiteColor,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
