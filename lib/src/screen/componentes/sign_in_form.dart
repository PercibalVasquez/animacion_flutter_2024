import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignIn extends StatelessWidget {
  const SignIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      // TODO: Inicia un formulario
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15), // TODO: Añade relleno horizontal al formulario
        child: Column(
          // TODO: Inicia una columna de widgets
          crossAxisAlignment: CrossAxisAlignment
              .start, // TODO: Alinea los widgets al inicio de la columna
          children: [
            const Text(
              // TODO: Muestra un texto constante 'Email'
              'Email',
              style: const TextStyle(
                  color: Colors.black54), // TODO: Estilo del texto
            ),
            Padding(
              // TODO: Añade relleno alrededor del TextFormField para 'Email'
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: TextFormField(
                // TODO: Campo de entrada de texto para el correo electrónico
                decoration: InputDecoration(
                  // TODO: Configuración de decoración para el TextFormField
                  prefixIcon: Padding(
                    // TODO: Añade relleno al icono del prefijo
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset(
                        'assets/icons/email.svg'), // TODO: Icono SVG para el correo electrónico
                  ),
                ),
              ),
            ),
            const Text(
              // TODO: Muestra un texto constante 'Password'
              'Password',
              style: const TextStyle(
                  color: Colors.black54), // TODO: Estilo del texto
            ),
            Padding(
              // TODO: Añade relleno alrededor del TextFormField para 'Password'
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: TextFormField(
                // TODO: Campo de entrada de texto para la contraseña
                obscureText: true, // TODO: Oculta el texto de la contraseña
                decoration: InputDecoration(
                  // TODO: Configuración de decoración para el TextFormField
                  prefixIcon: Padding(
                    // TODO: Añade relleno al icono del prefijo
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SvgPicture.asset(
                        'assets/icons/password.svg'), // TODO: Icono SVG para la contraseña
                  ),
                ),
              ),
            ),
            Padding(
              // TODO: Añade relleno alrededor del ElevatedButton
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed:
                    () {}, // TODO: Acción al presionar el botón (actualmente no hace nada)
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFFF77D8E), // TODO: Color de fondo del botón
                  minimumSize: const Size(
                      double.infinity, 56), // TODO: Tamaño mínimo del botón
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      // TODO: Bordes redondeados del botón
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),
                icon: const Icon(
                    CupertinoIcons.arrow_right), // TODO: Icono en el botón
                label: const Text('Sign In'), // TODO: Texto en el botón
              ),
            ),
          ],
        ),
      ),
    );
  }
}
