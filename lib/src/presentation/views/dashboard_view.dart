import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_gym_coach/src/config/router/app_router.dart';

import '../../utils/constants/app-colors.dart';
import '../../utils/constants/images.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        HomeViewRoute(),
        VideosViewRoute(),
        ProfileViewRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  t6_ic_meal,
                  width: 20,
                  height: 20,
                  color: t6textColorSecondary,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  t6_ic_meal,
                  width: 20,
                  height: 20,
                  color: t6textColorSecondary,
                ),
                label: 'Videos'),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  t6_ic_meal,
                  width: 20,
                  height: 20,
                  color: t6textColorSecondary,
                ),
                label: 'Profile'),
          ],
        );
      },
    );
  }
}
