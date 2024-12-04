import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../const/colors.dart';
import '../const/text_styles.dart';
import '../layout/default_layout.dart';

const Map<int, String> NAV_INDEX_ENDPOINT_MAPPER = {
  0: '/home',
  1: '/partner',
  2: '/place',
  3: '/festival',
  4: '/profile'
};

class ScaffoldWithNav extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNav({
    super.key,
    required this.navigationShell,
  });

  @override
  State<ScaffoldWithNav> createState() => _ScaffoldWithNavState();
}

class _ScaffoldWithNavState extends State<ScaffoldWithNav> {
  int currentIndex = 0;

  void onTapBottomNavigation(int index) {
    HapticFeedback.heavyImpact();

    final hasAlreadyOnBranch = index == widget.navigationShell.currentIndex;
    if (hasAlreadyOnBranch) {
      context.go(NAV_INDEX_ENDPOINT_MAPPER[index]!);
    } else {
      widget.navigationShell.goBranch(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    _initNavigationIndex(context);

    return DefaultLayout(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20.0,
        backgroundColor: MyColor.white,
        selectedItemColor: MyColor.text,
        selectedLabelStyle: MyTextStyle.subtitle18B.copyWith(fontSize: 12.0),
        unselectedItemColor: MyColor.middleGrey,
        unselectedFontSize: 12.0,
        unselectedLabelStyle: MyTextStyle.subtitle18B.copyWith(fontSize: 12.0),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: onTapBottomNavigation,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.house(),
              size: 30.0,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.sketchLogo(),
              size: 30.0,
            ),
            label: '파트너 찾기',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.buildingOffice(),
              size: 30.0,
            ),
            label: '공간 찾기',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.confetti(),
              size: 30.0,
            ),
            label: '행사 찾기',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.user(),
              size: 30.0,
            ),
            label: '마이',
          ),
        ],
      ),
      child: widget.navigationShell,
    );
  }

  void _initNavigationIndex(BuildContext context) {
    final routerState = GoRouterState.of(context);
    late int index;
    for (final entry in NAV_INDEX_ENDPOINT_MAPPER.entries) {
      if (routerState.fullPath!.startsWith(entry.value)) {
        index = entry.key;
      }
    }
    setState(() => currentIndex = index);
  }
}
