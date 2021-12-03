// import 'package:adahi_eidapp/screens/home_screens/home_screens.dart';
// import 'package:adahi_eidapp/screens/profile_screen/profile_screen.dart';
// import 'package:adahi_eidapp/screens/search_screen/search_screen.dart';
// import 'package:adahi_eidapp/screens/start-page_screen/dark_mode_screen.dart';
// import 'package:adahi_eidapp/screens/start-page_screen/language_screen.dart';
// import 'package:adahi_eidapp/screens/start-page_screen/model_drawer_item.dart';
// import 'package:adahi_eidapp/screens/start-page_screen/navigationprovider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nash_code/ui/start-page_screen/dark_mode_screen.dart';
import 'package:nash_code/ui/start-page_screen/language_screen.dart';
import 'package:nash_code/ui/start-page_screen/model_drawer_item.dart';
import 'package:nash_code/ui/start-page_screen/navigationprovider.dart';
import 'package:provider/provider.dart';

import 'drawerـitems.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    final provider = Provider.of<NavigationProvider>(context);
    final isCollapsed = provider.isCollapsed;

    return Container(
      width: isCollapsed ? MediaQuery.of(context).size.width * 0.2 : null,
      child: Drawer(
        child: Container(
          color: Color(0xFF1a2f45),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 24).add(safeArea),
                width: double.infinity,
                color: Colors.white12,
                child: buildHeader(isCollapsed),
              ),
              const SizedBox(height: 24.0),
              buildList(items: itemsFirst, isCollapsed: isCollapsed),
              const SizedBox(height: 24.0),
              Divider(color: Colors.white70),
              const SizedBox(height: 24.0),
              buildList(
                indexOffset: itemsFirst.length,
                items: itemsSecond,
                isCollapsed: isCollapsed,
              ),
              Spacer(),
              buildCollapseIcon(context, isCollapsed),
              const SizedBox(height: 12.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildList({
    @required bool isCollapsed,
    @required List<DrawerItem> items,
    int indexOffset = 0,
  }) =>
      ListView.separated(
        padding: isCollapsed ? EdgeInsets.zero : padding,
        shrinkWrap: true,
        primary: false,
        itemCount: items.length,
        separatorBuilder: (context, index) => SizedBox(height: 16.0),
        itemBuilder: (context, index) {
          final item = items[index];

          return buildMenuItem(
            isCollapsed: isCollapsed,
            text: item.title,
            icon: item.icon,
            onClicked: () => selectItem(context, indexOffset + index),
          );
        },
      );
  void selectItem(BuildContext context, int index) {
    final navigateTo = (page) => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => page,
        ));
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        //  navigateTo(HomeScreens());
        break;
        // case 1:
        //  navigateTo(SettingsScreen());
        break;
      case 1:
        navigateTo(LanguageScreen());
        break;
      case 2:
        navigateTo(DarkModeScreen());
        break;
        //case 4:
        // navigateTo(ProfileScreen());
        break;
        // case 5:
        // navigateTo(SearchScreen());
        break;
    }
  }

  Widget buildMenuItem({
    @required bool isCollapsed,
    @required String text,
    @required IconData icon,
    @required VoidCallback onClicked,
  }) {
    final color = Colors.white;
    final leading = Icon(icon, color: color);

    return Material(
      color: Colors.transparent,
      child: isCollapsed
          ? ListTile(
              title: leading,
              onTap: onClicked,
            )
          : ListTile(
              leading: leading,
              title: Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: onClicked,
            ),
    );
  }

  Widget buildCollapseIcon(BuildContext context, bool isCollapsed) {
    final double size = 52;
    final icon = isCollapsed ? Icons.arrow_forward_ios : Icons.arrow_back;

    final alignment = isCollapsed ? Alignment.center : Alignment.centerRight;
    final margin = isCollapsed ? null : EdgeInsets.only(right: 16.0);
    final width = isCollapsed ? double.infinity : size;

    return Container(
      alignment: alignment,
      margin: margin,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Container(
            width: width,
            height: size,
            child: Icon(icon, color: Colors.white),
          ),
          onTap: () {
            final provider =
                Provider.of<NavigationProvider>(context, listen: false);

            provider.toggleIsCollapsed();
          },
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollapsed) => isCollapsed
      ? CircleAvatar()
      : Row(
          children: [
            const SizedBox(width: 24.0),
            // CircleAvatar(
            //  radius: 35.0,
            //  backgroundImage: AssetImage("assets/images/sheep.png"),
            // ),

            FlutterLogo(size: 48.0),
            const SizedBox(width: 16.0),
            Text(
              'Adahi',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ],
        );
}
