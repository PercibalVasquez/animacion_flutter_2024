import 'package:animacion_flutter_2024/src/screen/componentes/sign_in_form.dart'; // TODO: Importa el componente de formulario de inicio de sesión
import 'package:flutter/material.dart'; // TODO: Importa el paquete de Flutter
import 'package:flutter_svg/svg.dart'; // TODO: Importa el paquete SVG de Flutter

Future<Object?> customSigninDialog(BuildContext context,
    {required ValueChanged onClosed}) {
  return showGeneralDialog(
    barrierDismissible:
        true, // TODO: Permite cerrar el diálogo al tocar fuera de él
    barrierLabel:
        'Sign In', // TODO: Etiqueta del fondo oscuro que cubre la pantalla
    context: context,
    transitionDuration: const Duration(
        milliseconds: 400), // TODO: Duración de la transición de animación
    transitionBuilder: (_, animation, secondaryAnimation, child) {
      Tween<Offset> tween;
      tween = Tween(
          begin: const Offset(0, -1),
          end: Offset
              .zero); // TODO: Configuración de la animación de deslizamiento
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(
              parent: animation,
              curve:
                  Curves.easeInOut), // TODO: Animación curva de deslizamiento
        ),
        child: child,
      );
    },
    pageBuilder: (context, builderContext, _) => Center(
      child: Container(
        height: 628,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 32),
        decoration: BoxDecoration(
          color: Colors.white
              .withOpacity(0.94), // TODO: Fondo semiopaco blanco del diálogo
          borderRadius:
              BorderRadius.circular(40), // TODO: Bordes redondeados del diálogo
        ),
        child: Scaffold(
          backgroundColor:
              Colors.transparent, // TODO: Fondo transparente del scaffold
          body: Stack(
            clipBehavior:
                Clip.none, // TODO: No recorta los widgets que sobresalen
            children: [
              Column(
                children: [
                  const Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 34,
                        fontFamily:
                            'Poppins'), // TODO: Estilo del texto "Sign In"
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Access to 240+ hours of content learn design and code, by building real apps with flutter and Swift',
                      textAlign: TextAlign.center, // TODO: Alineación del texto
                    ),
                  ),
                  const SignIn(), // TODO: Widget del formulario de inicio de sesión
                  const Row(
                    children: [
                      Expanded(
                          child: Divider()), // TODO: Línea divisoria expandible
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'OR',
                          style: TextStyle(
                              color: Colors
                                  .black26), // TODO: Estilo del texto "OR"
                        ),
                      ),
                      Expanded(
                          child: Divider()), // TODO: Línea divisoria expandible
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text('Sign up with Email, Apple or Google',
                        style: TextStyle(
                            color: Colors
                                .black54)), // TODO: Estilo del texto "Sign up with Email, Apple or Google"
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/email_box.svg',
                          height: 35,
                          width: 35,
                        ), // TODO: Icono de correo electrónico
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/apple_box.svg',
                          height: 35,
                          width: 35,
                        ), // TODO: Icono de Apple
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/google_box.svg',
                          height: 35,
                          width: 35,
                        ), // TODO: Icono de Google
                      ),
                    ],
                  ),
                ],
              ),
              const Positioned(
                left: 0,
                right: 0,
                bottom: -42,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors
                      .white, // TODO: Fondo blanco del círculo del botón de cierre
                  child: Icon(Icons.close,
                      color: Colors
                          .black), // TODO: Icono de cierre en el círculo blanco
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ).then(onClosed);
}
