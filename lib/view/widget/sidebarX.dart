import 'package:Hector_Show_movie/res/AppContextExtension.dart';
import 'package:Hector_Show_movie/utils/imageurl.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

// ignore: must_be_immutable
class SideBarX extends StatelessWidget {
  final SidebarXController _controllerSideBar;
  final Function function;
  final String page;

  SideBarX(
      {Key? key,
      required SidebarXController controller,
      required this.function,
      required this.page})
      : _controllerSideBar = controller;

  late var width = 100.0;

  String flagUrl = "assets/images/flags/usa.png";
  String flagUrlSpain = "assets/images/flags/spain.png";
  String flagUrlUSA = "assets/images/flags/usa.png";

  @override
  Widget build(BuildContext context) {
    const canvasColor = Colors.red;
    const white = Colors.white;
    final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
    final divider = Divider(color: white.withOpacity(0.3), height: 1);

    return SidebarX(
      controller: _controllerSideBar,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: context.resources.color.colorPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: context.resources.color.colorPrimary,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: context.resources.color.colorPrimary),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
            child: circulo(flagUrl),
          ),
        );
      },
      items: [
        SidebarXItem(
            iconWidget: icono(flagUrlUSA),
            label: 'English',
            onTap: () {
              flagUrl = "assets/images/flags/usa.png";
              function("en-US");
            }),
        SidebarXItem(
            iconWidget: icono(flagUrlSpain),
            label: 'Spanish',
            onTap: () {
              flagUrl = "assets/images/flags/spain.png";
              function("es-ES");
            }),
      ],
    );
  }

  Widget icono(String flagUrl) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(flagUrl),
          fit: BoxFit.cover,
        ),
      ),
      width: width / 6,
      height: width / 6,
      padding: EdgeInsets.all(10),
    );
  }

  Widget circulo(String flagUrl) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(flagUrl),
          fit: BoxFit.cover,
        ),
      ),
      width: 80,
      height: 80,
      padding: EdgeInsets.all(5),
    );
  }
}
