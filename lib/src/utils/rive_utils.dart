import 'package:rive/rive.dart';

class RiveUtils{
  static StateMachineController getRiveController(Artboard artboard, {stateMachine="State Machine 1"}) {
    StateMachineController? controller = StateMachineController.fromArtboard(
        artboard,
        stateMachine); // TODO: Obtiene el controlador de la máquina de estados del artefacto Rive
    artboard.addController(controller!);
    return controller;
  }
}