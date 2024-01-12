import 'package:animacion_flutter_2024/src/models/rive_assets.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenuTitle extends StatelessWidget {
  const SideMenuTitle({
    super.key,
    required this.menu,
    required this.riveInit,
    required this.isActive,
    required this.onTap,
  });
  final RiveAsset menu;
  final Function()? onTap;
  final ValueChanged<Artboard> riveInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white,
            height: 1,
          ),
        ),
        Stack(
          children: [
             AnimatedPositioned(
              duration: const Duration(milliseconds: 320),
              curve: Curves.fastOutSlowIn,
              height: 56,
              width: isActive ? 288 : 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color:  Color(0XFF6792FF),
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),
              ),
            ),
            ListTile(
              onTap: onTap,
              leading: SizedBox(
                height: 34,
                width: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveInit,
                ),
              ),
              title: Text(
                menu.title,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
