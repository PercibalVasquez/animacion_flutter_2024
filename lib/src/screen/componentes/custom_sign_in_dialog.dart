// Importa las librerías necesarias.
// TODO: Importa las librerías necesarias para el diálogo.
import 'package:animacion_flutter_2024/src/screen/componentes/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Crea un diálogo personalizado para iniciar sesión.
// TODO: Crear un diálogo personalizado para iniciar sesión.
Future<Object?> customSigninDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  // Muestra un diálogo general con una transición de deslizamiento.
  // TODO: Muestra un diálogo general con una transición de deslizamiento.
  return showGeneralDialog(
    barrierDismissible: true, // TODO: Establece la bandera de cierre de la barrera.
    barrierLabel: 'Iniciar sesión', // TODO: Establece la etiqueta de la barrera.
    context: context, // TODO: Establece el contexto.
    transitionDuration: const Duration(milliseconds: 400), // TODO: Establece la duración de la transición.
    transitionBuilder: (_, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween =
          Tween(begin: const Offset(0, -1), end: Offset.zero); // TODO: Crea un tween para el desplazamiento.
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ), // TODO: Anima la posición usando una animación curva.
        child: child, // TODO: Establece el widget hijo.
      );
    },
    // Construye el contenido del diálogo.
    // TODO: Construir el contenido del diálogo.
    pageBuilder: (context, builderContext, _) => Center(
          child: Container(
            height: 628, // TODO: Establece la altura del contenedor.
            margin: const EdgeInsets.symmetric(horizontal: 20), // TODO: Establece el margen del contenedor.
            padding: const EdgeInsets.symmetric(vertical: 32), // TODO: Establece el relleno del contenedor.
            decoration: BoxDecoration( // TODO: Establece la decoración del contenedor.
              color: Colors.white.withOpacity(0.94), // TODO: Establece el color del contenedor.
              borderRadius: BorderRadius.circular(40), // TODO: Establece el radio del borde del contenedor.
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent, // TODO: Establece el color de fondo del scaffold.
              body: Stack(
                clipBehavior: Clip.none, // TODO: Establece el comportamiento del clip del stack.
                children: [
                  Column(
                    children: [
                      const Text(
                        'Iniciar sesión', // TODO: Establece el texto del título.
                        style: TextStyle(fontSize: 34, fontFamily: 'Poppins'), // TODO: Establece el estilo del título.
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16), // TODO: Establece el relleno del subtítulo.
                        child: Text(
                          'Acceso a más de 240 horas de contenido para aprender diseño y código, creando aplicaciones reales con Flutter y Swift', // TODO: Establece el texto del subtítulo.
                          textAlign: TextAlign.center, // TODO: Establece la alineación del texto del subtítulo.
                        ),
                      ),
                      const SignInForm(), // TODO: Añade el formulario de inicio de sesión.
                      const Row(
                        children: [
                          Expanded(child: Divider()), // TODO: Añade un divisor.
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10), // TODO: Establece el relleno del texto OR.
                            child: Text(
                              'O', // TODO: Establece el texto del texto OR.
                              style: TextStyle(color: Colors.black26), // TODO: Establece el estilo del texto OR.
                            ),
                          ),
                          Expanded(child: Divider()), // TODO: Añade un divisor.
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 18), // TODO: Establece el relleno del texto de registro con correo electrónico.
                        child: Text(
                          'Regístrate con correo electrónico, Apple o Google', // TODO: Establece el texto del texto de registro con correo electrónico.
                          style: TextStyle(color: Colors.black54), // TODO: Establece el estilo del texto de registro con correo electrónico.
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // TODO: Establece la alineación del eje principal de los botones.
                        children: [
                          IconButton(
                            padding: EdgeInsets.zero, // TODO: Establece el relleno del botón de correo electrónico.
                            onPressed: () {}, // TODO: Establece la devolución de llamada de onPressed del botón de correo electrónico.
                            icon: SvgPicture.asset(
                              'assets/icons/email_box.svg', // TODO: Establece la ruta del archivo del icono de correo electrónico.
                              height: 45, // TODO: Establece la altura del icono de correo electrónico.
                              width: 45, // TODO: Establece el ancho del icono de correo electrónico.
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero, // TODO: Establece el relleno del botón de Apple.
                            onPressed: () {}, // TODO: Establece la devolución de llamada de onPressed del botón de Apple.
                            icon: SvgPicture.asset(
                              'assets/icons/apple_box.svg', // TODO: Establece la ruta del archivo del icono de Apple.
                              height: 45, // TODO: Establece la altura del icono de Apple.
                              width: 45, // TODO: Establece el ancho del icono de Apple.
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero, // TODO: Establece el relleno del botón de Google.
                            onPressed: () {}, // TODO: Establece la devolución de llamada de onPressed del botón de Google.
                            icon: SvgPicture.asset(
                              'assets/icons/google_box.svg', // TODO: Establece la ruta del archivo del icono de Google.
                              height: 45, // TODO: Establece la altura del icono de Google.
                              width: 45, // TODO: Establece el ancho del icono de Google.
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Positioned(
                    left: 0,
                    right: 0,
                    bottom: -42, // TODO: Establece la posición inferior del botón de cierre.
                    child: CircleAvatar(
                      radius: 16, // TODO: Establece el radio del botón de cierre.
                      backgroundColor: Colors.white, // TODO: Establece el color de fondo del botón de cierre.
                      child: Icon(Icons.close, color: Colors.black), // TODO: Establece el icono del botón de cierre.
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
  ).then(onClosed);
}