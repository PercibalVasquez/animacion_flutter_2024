// Importa el paquete Rive.
import 'package:rive/rive.dart';

// Crea una clase llamada RiveUtils que contiene funciones para trabajar con animaciones Rive.
class RiveUtils{

  // Crea una función estática llamada getRiveController que devuelve un StateMachineController.
  static StateMachineController getRiveController(

    // El primer parámetro es el artboard que contiene la animación Rive.
    Artboard artboard, 

    // El segundo parámetro es una cadena opcional que especifica el nombre de la máquina de estados a utilizar. Si no se especifica, se utilizará "State Machine 1".
    {String stateMachine = "State Machine 1"}
  ) {

    // Crea un StateMachineController que controla la máquina de estados Rive.
    StateMachineController? controller = 

      // Utiliza el método fromArtboard para crear el StateMachineController a partir del artboard especificado.
      StateMachineController.fromArtboard(
        artboard,
        stateMachine
      );

    // Añade el controlador al artboard.
    artboard.addController(controller!);

    // Devuelve el controlador.
    return controller;
  }
}
/*

**Comentarios en español:**

* La línea `import 'package:rive/rive.dart';` **importa** el **paquete** Rive, que es una biblioteca para animar gráficos vectoriales interactivos.
* La **clase** `RiveUtils` **contiene** **funciones** para **trabajar** con **animaciones** Rive.
* La **función** `getRiveController` **devuelve** un `StateMachineController` que **controla** una **máquina** de **estados** Rive.
* El **parámetro** `artboard` de `getRiveController` es el `artboard` que **contiene** la **animación** Rive.
* El **parámetro** `stateMachine` de `getRiveController` es una **cadena** **opcional** que **específica** el **nombre** de la **máquina** de **estados** que se **utilizará**. Si no se **específica**, se **utilizará** "State Machine 1".
* La **función** `getRiveController` **crea** un `StateMachineController` utilizando el **método** `fromArtboard` del `artboard` **especificado**.
* La **función** `getRiveController` **añade** el `StateMachineController` al `artboard`.
* La **función** `getRiveController` **devuelve** el `StateMachineController`.*/