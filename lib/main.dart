import 'package:flutter/material.dart';
import 'package:frminsertar49/vistas/iniciodesesion.dart';
import 'package:frminsertar49/vistas/insertar.dart';
import 'package:frminsertar49/vistas/insertarusuario.dart';
import 'package:frminsertar49/vistas/perfilcliente.dart';
import 'package:frminsertar49/vistas/probando.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define las rutas aquí

      routes: {
        '/': (context) => IniciarSesionPage(), // Página de inicio de sesión
        '/perfil_cliente': (context) => PerfilClienteView(), // Página de perfil del cliente
        // Define otras rutas aquí
      },
      initialRoute: '/', // Ruta inicial
    );
  }
}




