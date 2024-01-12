// Importamos las bibliotecas necesarias
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

// Definimos un widget personalizado para el botón de menú
class menuBtn extends StatelessWidget {
  // Constructor del widget
  const menuBtn({
    // Función a ejecutar al pulsar el botón
    super.key,
    required this.onTap,
    // Función a ejecutar al inicializar el widget
    required this.riveOnInit,
  });

  // Función a ejecutar al pulsar el botón
  final Function()? onTap;

  // Función a ejecutar al inicializar el widget
  final ValueChanged<Artboard> riveOnInit;

  // Método que construye el widget
  @override
  Widget build(BuildContext context) {
    //Devolvemos el widget
    return SafeArea(
      // Wrap the GestureDetector in a SafeArea to avoid the notch
      child: GestureDetector(
        // Establecemos la función a ejecutar al pulsar el botón
        onTap: onTap,
        // Creamos un contenedor para el botón
        child: Container(
          // Establecemos un margen al contenedor
          margin: const EdgeInsets.only(left: 16),
          // Establecemos el alto y ancho del contenedor
          height: 40,
          width: 40,
          // Establecemos la decoración del contenedor
          decoration: const BoxDecoration(
              // Establecemos el color del contenedor
              color: Colors.white,
              // Establecemos la forma del contenedor
              shape: BoxShape.circle,
              // Establecemos la sombra del contenedor
              boxShadow: [
                BoxShadow(
                    // Establecemos el color de la sombra
                    color: Colors.black12,
                    // Establecemos la posición de la sombra
                    offset: Offset(0, 3),
                    // Establecemos el desenfoque de la sombra
                    blurRadius: 8)
              ]),
          // Creamos una animación Rive
          child: RiveAnimation.asset(
            // Establecemos el asset de la animación
            'assets/RiveAssets/menu_button.riv',
            // Establecemos la función a ejecutar al inicializar la animación
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
/*
* El primer comentario es una importación de la biblioteca `flutter/material.dart`, que contiene los widgets básicos de Flutter.
* El segundo comentario es una importación de la biblioteca `rive/rive.dart`, que contiene los widgets de animación de Rive.
* El tercer comentario es la definición de la clase `menuBtn`, que es un widget personalizado para el botón de menú.
* El cuarto comentario es el constructor de la clase `menuBtn`, que recibe dos parámetros: `onTap` y `riveOnInit`.
* El quinto comentario es la declaración del parámetro `onTap`, que es una función que se ejecuta al pulsar el botón.
* El sexto comentario es la declaración del parámetro `riveOnInit`, que es una función que se ejecuta al inicializar la animación de Rive.
* El séptimo comentario es el método `build`, que es el método que construye el widget.
* El octavo comentario es la creación de un widget `SafeArea`, que evita que el widget se superponga a la muesca del dispositivo.
* El noveno comentario es la creación de un widget `GestureDetector`, que permite la detección de gestos en el widget.
* El décimo comentario es la asignación de la función `onTap` al evento `onTap` del widget `GestureDetector`.
* El undécimo comentario es la creación de un widget `Container`, que es el contenedor del botón.
* El duodécimo comentario es la asignación de un margen al widget `Container`.
* El decimotercer comentario es la asignación de un alto y ancho al widget `Container`.
* El decimocuarto comentario es la asignación de una decoración al widget `Container`.
* El decimoquinto comentario es la creación de una animación Rive.
* El decimosexto comentario es la asignación del asset de la animación Rive.
* El decimoséptimo comentario es la asignación de la función `riveOnInit` al evento `onInit` de la animación Rive.
* El decimoctavo comentario es la devolución del widget. */