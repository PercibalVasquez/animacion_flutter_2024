import 'dart:math';

import 'package:animacion_flutter_2024/src/constantes.dart';
import 'package:animacion_flutter_2024/src/home/componentes/side_menu.dart';
import 'package:animacion_flutter_2024/src/home/home_screen.dart';
import 'package:animacion_flutter_2024/src/models/menu_btn.dart';
import 'package:animacion_flutter_2024/src/screen/componentes/animated_bar.dart';
import 'package:animacion_flutter_2024/src/models/rive_assets.dart';
import 'package:animacion_flutter_2024/src/utils/rive_utils.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint>
    with SingleTickerProviderStateMixin {
  late AnimationController _animatedController;
  late Animation<double> animation;
  late Animation<double> scalAnimation;
  RiveAsset selectedBottomNav = bottomNavs.first;
  late SMIBool isSideBarClosed;
  bool isSideMenuClosed = true;

  @override
  void initState() {
    // TODO: implement initState
    _animatedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {
          animation = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(
                parent: _animatedController, curve: Curves.fastOutSlowIn),
          );
          scalAnimation = Tween<double>(begin: 0, end: 0.8).animate(
            CurvedAnimation(
                parent: _animatedController, curve: Curves.fastOutSlowIn),
          );
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _animatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animatedController, curve: Curves.fastOutSlowIn),
    );
    scalAnimation = Tween<double>(begin: 1, end: 0.8).animate(
      CurvedAnimation(parent: _animatedController, curve: Curves.fastOutSlowIn),
    );
    return Scaffold(
      backgroundColor: backgroundColor2,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeInOutCubicEmphasized,
              width: 280,
              left: isSideMenuClosed ? -288 : 0,
              height: MediaQuery.of(context).size.height,
              child: const SideMenu()),
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 288, 0),
              child: Transform.scale(
                  scale: scalAnimation.value,
                  child: const ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      child: HomeScreen())),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 600),
            curve: Curves.fastOutSlowIn,
            left: isSideMenuClosed ? 0 : 220,
            top: 16,
            child: menuBtn(
              riveOnInit: (artboard) {
                StateMachineController controller = RiveUtils.getRiveController(
                    artboard,
                    stateMachine: "State Machine");
                isSideBarClosed = controller.findSMI('isOpen') as SMIBool;
                isSideBarClosed.value = true;
              },
              onTap: () {
                isSideBarClosed.value = !isSideBarClosed.value;
                if (isSideMenuClosed) {
                  _animatedController.forward();
                } else {
                  _animatedController.reverse();
                }
                setState(() {
                  isSideMenuClosed = isSideBarClosed.value;
                });
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0, 100*animation.value),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: backgroundColor2.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                  bottomNavs.length,
                  (index) => GestureDetector(
                    onTap: () {
                      bottomNavs[index].input!.change(true);
                      if (bottomNavs[index] != selectedBottomNav) {
                        setState(() {
                          selectedBottomNav = bottomNavs[index];
                        });
                      }
        
                      Future.delayed(const Duration(seconds: 1), () {
                        bottomNavs[index].input!.change(false);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedBard(
                            isActive: bottomNavs[index] == selectedBottomNav),
                        SizedBox(
                          height: 36,
                          width: 36,
                          child: Opacity(
                            opacity:
                                bottomNavs[index] == selectedBottomNav ? 1 : 0.5,
                            child: RiveAnimation.asset(
                              bottomNavs.first.src,
                              artboard: bottomNavs[index].artboard,
                              onInit: (artboard) {
                                StateMachineController controller =
                                    RiveUtils.getRiveController(
                                  artboard,
                                  stateMachine:
                                      bottomNavs[index].stateMachineName,
                                );
                                bottomNavs[index].input =
                                    controller.findSMI('active') as SMIBool;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
