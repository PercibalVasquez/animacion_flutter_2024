import 'package:animacion_flutter_2024/src/screen/componentes/CustomPosutioned.dart'; // TODO: Importa el componente CustomPositioned
import 'package:flutter/cupertino.dart'; // TODO: Importa el paquete Cupertino
import 'package:flutter/material.dart'; // TODO: Importa el paquete material de Flutter
import 'package:flutter_svg/flutter_svg.dart'; // TODO: Importa el paquete Flutter SVG
import 'package:rive/rive.dart'; // TODO: Importa el paquete Rive

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // TODO: Crea una clave global para el formulario
  bool isShowLoading = false; // TODO: Inicializa la variable isShowLoading en false
  bool isShowConfetti = false; // TODO: Inicializa la variable isShowConfetti en false
  late SMITrigger check; // TODO: Declara una variable check del tipo SMITrigger
  late SMITrigger error; // TODO: Declara una variable error del tipo SMITrigger
  late SMITrigger reset; // TODO: Declara una variable reset del tipo SMITrigger
  late SMITrigger confetti; // TODO: Declara una variable confetti del tipo SMITrigger

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, "State Machine 1"); // TODO: Obtiene el controlador de la máquina de estados del artefacto Rive
    artboard.addController(controller!);
    return controller;
  }

  void signIn(BuildContext context) {
    setState(() {
      isShowLoading = true; // TODO: Establece isShowLoading en true
      isShowConfetti = true; // TODO: Establece isShowConfetti en true
    });

    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (_formKey.currentState!.validate()) {
          check.fire(); // TODO: Activa el gatillo Check

          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false; // TODO: Establece isShowLoading en false
              });
              confetti.fire(); // TODO: Activa el gatillo Trigger explosion de la animación confetti
            },
          );
        } else {
          error.fire(); // TODO: Activa el gatillo Error

          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false; // TODO: Establece isShowLoading en false
              });
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey, // TODO: Asigna la clave global al formulario
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email",
                  style: TextStyle(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ""; // TODO: Valida que el campo de correo electrónico no esté vacío
                      }
                      return null;
                    },
                    onSaved: (email) {}, // TODO: Guarda el valor del correo electrónico
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SvgPicture.asset("assets/icons/email.svg"), // TODO: Muestra el icono del correo electrónico
                      ),
                    ),
                  ),
                ),
                const Text(
                  "Password",
                  style: TextStyle(color: Colors.black54),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 16),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ""; // TODO: Valida que el campo de contraseña no esté vacío
                      }
                      return null;
                    },
                    onSaved: (password) {}, // TODO: Guarda el valor de la contraseña
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SvgPicture.asset("assets/icons/password.svg"), // TODO: Muestra el icono de la contraseña
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 24),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      signIn(context); // TODO: Llama a la función signIn al presionar el botón
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF77D8E), // TODO: Establece el color de fondo del botón
                      minimumSize: const Size(double.infinity, 56), // TODO: Establece el tamaño mínimo del botón
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25), // TODO: Establece la forma del botón con bordes redondeados
                        ),
                      ),
                    ),
                    icon: const Icon(
                      CupertinoIcons.arrow_right,
                      color: Color(0xFFFE0037), // TODO: Establece el color del icono
                    ),
                    label: const Text("Sign In"), // TODO: Etiqueta del botón
                  ),
                ),
              ],
            ),
          ),
        ),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  "assets/RiveAssets/check.riv", // TODO: Carga la animación Rive desde el archivo check.riv
                  onInit: (artboard) {
                    StateMachineController controller =
                        getRiveController(artboard); // TODO: Obtiene el controlador de la máquina de estados de la animación Rive
                    check = controller.findSMI("Check") as SMITrigger; // TODO: Encuentra el gatillo Check
                    error = controller.findSMI("Error") as SMITrigger; // TODO: Encuentra el gatillo Error
                    reset = controller.findSMI("Reset") as SMITrigger; // TODO: Encuentra el gatillo Reset
                  },
                ),
              )
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                child: Transform.scale(
                  scale: 7,
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/confetti.riv", // TODO: Carga la animación Rive desde el archivo confetti.riv
                    onInit: (artboard) {
                      StateMachineController controller =
                          getRiveController(artboard); // TODO: Obtiene el controlador de la máquina de estados de la animación Rive
                      confetti =
                          controller.findSMI("Trigger explosion") as SMITrigger; // TODO: Encuentra el gatillo Trigger explosion
                    },
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
