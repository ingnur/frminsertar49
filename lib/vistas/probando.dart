/*import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PerfilClienteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Cliente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Contenido del perfil del cliente aquí'),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final token = prefs.getString('jwt_token');
                print('Token JWT almacenado: $token');
              },
              child: Text('Obtener Token JWT'),
            ),
          ],
        ),
      ),
    );
  }
}*/


/*import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PerfilClienteView extends StatefulWidget {
  @override
  _PerfilClienteViewState createState() => _PerfilClienteViewState();
}

class _PerfilClienteViewState extends State<PerfilClienteView> {
  String nombre = '';
  String apellido = '';
  String correo = '';
  String celular = '';

  @override
  void initState() {
    super.initState();
    obtenerDatosCliente();
  }

  Future<void> obtenerDatosCliente() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    final apiUrl = 'http://192.168.137.1/perfil_cliente'; // Reemplaza con la URL correcta de tu backend

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $token', // Agrega el token JWT en el encabezado
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      setState(() {
        nombre = responseData['nombre'];
        apellido = responseData['apellido'];
        correo = responseData['correo'];
        celular = responseData['celular'];
      });
    } else {
      // Manejar errores aquí, por ejemplo, redirigir al usuario al inicio de sesión si el token es inválido.
      Navigator.pushReplacementNamed(context, '/iniciar_sesion');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Cliente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: $nombre'),
            Text('Apellido: $apellido'),
            Text('Correo: $correo'),
            Text('Celular: $celular'),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final token = prefs.getString('jwt_token');
                print('Token JWT almacenado: $token');
              },
              child: Text('Obtener Token JWT'),
            ),
          ],
        ),
      ),
    );
  }
}*/


/*import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PerfilClienteView extends StatefulWidget {
  @override
  _PerfilClienteViewState createState() => _PerfilClienteViewState();
}

class _PerfilClienteViewState extends State<PerfilClienteView> {
  String nombre = '';
  String apellido = '';
  String correo = '';
  String celular = '';

  @override
  void initState() {
    super.initState();
    obtenerDatosCliente();
  }

  Future<void> obtenerDatosCliente() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');

    final apiUrl = 'http://192.168.137.1/perfil_cliente'; // Reemplaza con la URL correcta de tu backend

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $token', // Agrega el token JWT en el encabezado
      },
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      print(responseData[nombre]);
      setState(() {
        nombre = responseData['nombre'];
        apellido = responseData['apellido'];
        correo = responseData['correo'];
        celular = responseData['celular'];
      });
    } else {
      // Manejar errores aquí, por ejemplo, redirigir al usuario al inicio de sesión si el token es inválido.
      Navigator.pushReplacementNamed(context, '/iniciar_sesion');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Cliente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: $nombre'),
            Text('Apellido: $apellido'),
            Text('Correo: $correo'),
            Text('Celular: $celular'),
            ElevatedButton(
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                final token = prefs.getString('jwt_token');
                print('Token JWT almacenado: $token');
              },
              child: Text('Obtener Token JWT'),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilClienteView extends StatefulWidget {
  @override
  _PerfilClienteViewState createState() => _PerfilClienteViewState();
}

class _PerfilClienteViewState extends State<PerfilClienteView> {
  String nombre = '';
  String apellido = '';
  String correo = '';
  String celular = '';

  @override
  void initState() {
    super.initState();
    cargarDatosPerfil(); // Cargar datos del perfil al iniciar la vista
  }

  Future<void> cargarDatosPerfil() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt_token');
    print('Token JWT almacenado: $token');


    final url = Uri.parse('http://192.168.137.1/perfil_cliente');
    final response = await http.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final perfilData = json.decode(response.body);
      print("Aqueeeeeeeee");
      print(perfilData);
      setState(() {
        nombre = perfilData['nombre'];
        apellido = perfilData['apellido'];
        correo = perfilData['correo'];
        celular = perfilData['celular'];
      });
    } else {
      // Manejar errores de carga de perfil aquí
      print('Error al cargar datos del perfil');
    }
  }

  Future<void> actualizarPerfil() async {
    // Aquí puedes implementar la lógica para actualizar el perfil
    // Puedes hacer una solicitud HTTP POST para enviar los datos actualizados al servidor
    // y manejar las respuestas y errores en consecuencia
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil de Cliente'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: $nombre'),
            Text('Apellido: $apellido'),
            Text('Correo: $correo'),
            Text('Celular: $celular'),
            ElevatedButton(
              onPressed: () {
                // Llamar a la función para actualizar el perfil
                actualizarPerfil();
              },
              child: Text('Actualizar Perfil'),
            ),
          ],
        ),
      ),
    );
  }
}


