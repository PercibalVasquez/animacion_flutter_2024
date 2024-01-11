import 'package:animacion_flutter_2024/src/screen/onboding/onboding_screen.dart'; // TODO: Importa la pantalla de bienvenida personalizada
import 'package:flutter/material.dart'; // TODO: Importa el paquete de Flutter

void main() => runApp(
    const MyApp()); // TODO: Inicia la aplicación Flutter con el widget MyApp

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // TODO: Desactiva la bandera de modo de depuración en la esquina superior derecha
      title: 'The Flutter Way', // TODO: Título de la aplicación
      theme: ThemeData(
        scaffoldBackgroundColor:
            const Color(0xFFEEF1F8), // TODO: Color de fondo del scaffold
        primarySwatch: Colors.blue, // TODO: Paleta de colores principal
        fontFamily: "Intel", // TODO: Fuente principal de la aplicación
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors
                  .white), // TODO: Estilo predeterminado para los botones elevados
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true, // TODO: Relleno activado para las cajas de entrada
          fillColor:
              Colors.white, // TODO: Color de relleno de las cajas de entrada
          errorStyle:
              TextStyle(height: 0), // TODO: Altura cero para el estilo de error
          border:
              defaultInputBorder, // TODO: Borde predeterminado para las cajas de entrada
          enabledBorder:
              defaultInputBorder, // TODO: Borde activado para las cajas de entrada
          focusedBorder:
              defaultInputBorder, // TODO: Borde enfocado para las cajas de entrada
          errorBorder:
              defaultInputBorder, // TODO: Borde de error para las cajas de entrada
        ),
      ),
      home:
          const OnboardingScreen(), // TODO: Establece la pantalla de bienvenida como la pantalla de inicio
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(
      16)), // TODO: Bordes redondeados para las cajas de entrada
  borderSide: BorderSide(
    color: Color(0xFFDEE3F2), // TODO: Color del borde de las cajas de entrada
    width: 1,
  ),
);
