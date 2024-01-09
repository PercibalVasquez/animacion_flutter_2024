import 'package:flutter/material.dart'; // TODO: Importa el paquete de Flutter
import 'package:rive/rive.dart'; // TODO: Importa el paquete Rive
import 'package:animacion_flutter_2024/src/screen/componentes/animated_btn.dart'; // TODO: Importa el componente de botón animado
import 'package:animacion_flutter_2024/src/screen/componentes/custom_sign_in_dialog.dart'; // TODO: Importa el componente de diálogo personalizado
import 'dart:ui'; // TODO: Importa la biblioteca dart:ui

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState(); // TODO: Crea el estado del widget OnboardingScreen
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isSignInDialogShow = false; // TODO: Variable para controlar la visibilidad del diálogo de inicio de sesión
  late RiveAnimationController animationController; // TODO: Controlador de animación Rive

  @override
  void initState() {
    super.initState(); // TODO: Llama al initState de la clase padre
    animationController = OneShotAnimation(
      'active',
      autoplay: false, // TODO: Inicializa el controlador de animación en modo OneShot sin reproducción automática
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // TODO: Estructura principal del widget
      body: Stack( // TODO: Un stack que contiene múltiples elementos apilados uno encima del otro
        children: [
          Positioned( // TODO: Posiciona un widget en una posición específica del stack
            width: MediaQuery.of(context).size.width * 1.7, // TODO: Ajusta el ancho según el ancho de la pantalla
            bottom: 200, // TODO: Ajusta la posición vertical desde la parte inferior
            left: 100, // TODO: Ajusta la posición horizontal desde la izquierda
            child: Image.asset('assets/Backgrounds/Spline.png'), // TODO: Coloca una imagen en una posición específica
          ),
          const RiveAnimation.asset('assets/RiveAssets/shapes.riv'), // TODO: Carga una animación Rive desde un archivo
          Positioned.fill( // TODO: Ocupa todo el espacio disponible en el stack
            child: BackdropFilter( // TODO: Aplica un filtro de fondo
              filter: ImageFilter.blur( // TODO: Aplica un efecto de desenfoque a la imagen de fondo
                sigmaX: 30, // TODO: Ajusta el desenfoque horizontal (sigmaX)
                sigmaY: 30, // TODO: Ajusta el desenfoque vertical (sigmaY)
              ),
              child: const SizedBox(), // TODO: Un contenedor vacío dentro del filtro de fondo
            ),
          ),
          AnimatedPositioned( // TODO: Posiciona un widget animado en una posición específica
            top: isSignInDialogShow ? -50 : 0, // TODO: Ajusta la posición superior según la visibilidad del diálogo de inicio de sesión
            duration: const Duration(milliseconds: 240),
            height: MediaQuery.of(context).size.height, // TODO: Ajusta la altura según la altura de la pantalla
            width: MediaQuery.of(context).size.width, // TODO: Ajusta el ancho según el ancho de la pantalla
            child: SafeArea( // TODO: Asegura un área segura para el contenido
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column( // TODO: Una columna de widgets apilados verticalmente
                  children: [
                    const Spacer(), // TODO: Un espacio flexible que ocupa todo el espacio disponible
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
                    const Spacer( // TODO: Un espacio flexible que ocupa todo el espacio disponible
                      flex: 2,
                    ),
                    AnimatedBtn( // TODO: Botón animado
                      animationController: animationController,
                      callback: () {
                        animationController.isActive = true;
                        Future.delayed(const Duration(milliseconds: 750), () {
                          setState(() {
                            isSignInDialogShow = true;
                          });
                          customSigninDialog(context, onClosed: (_) { // TODO: Llamada a la función que muestra el diálogo de inicio de sesión personalizado
                            setState(() {
                              isSignInDialogShow = false;
                            });
                          });
                        });
                      },
                    ),
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
