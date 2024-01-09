import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required this.animationController, required this.callback,
  });

  final RiveAnimationController animationController;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: SizedBox(
        height: 64,
        width: 200,
        child: Stack(
          children: [
            RiveAnimation.asset(
              'assets/RiveAssets/button.riv',
              controllers: [animationController],
            ),
            const Positioned.fill(
              top: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.arrow_right),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Inicia el curso',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
