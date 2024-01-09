import 'dart:ui';
import 'package:animacion_flutter_2024/src/screen/componentes/animated_btn.dart';
import 'package:animacion_flutter_2024/src/screen/componentes/custom_sign_in_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:rive/rive.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSingInDialogShow = false;
  late RiveAnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = OneShotAnimation(
      'active',
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset('assets/Backgrounds/Spline.png'),
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30,
              ),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSingInDialogShow ? -50 : 0,
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    const Spacer(),
                    const SizedBox(
                      width: 260,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Aprende diseño y código',
                            style: TextStyle(
                              fontSize: 55,
                              fontFamily: 'Poppins',
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'No te saltes el diseño. Aprende diseño y código, creando aplicaciones reales con Flutter y Swift. Completa cursos sobre las mejores herramientas.',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    AnimatedBtn(
                        animationController: animationController,
                        callback: () {
                          animationController.isActive = true;
                          Future.delayed(const Duration(milliseconds: 750), () {
                            setState(() {
                              isSingInDialogShow = true;
                            });
                            customSigninDialog(context, onClosed: (_) {
                              setState(() {
                                isSingInDialogShow = false;
                              });
                            });
                          });
                        }),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                        "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates.",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
