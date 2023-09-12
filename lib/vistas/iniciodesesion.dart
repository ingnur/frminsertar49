/*import 'package:flutter/material.dart';
import 'package:frminsertar49/vistas/perfilcliente.dart';
import 'package:frminsertar49/vistas/probando.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class IniciarSesionPage extends StatefulWidget {
  @override
  _IniciarSesionPageState createState() => _IniciarSesionPageState();
}

class _IniciarSesionPageState extends State<IniciarSesionPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _enviarFormulario() async {
    final dio = Dio();
    final cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    final String apiUrl = 'http://192.168.137.1/api/token/';
    final Map<String, dynamic> requestBody = {
      'username': _usernameController.text,
      'password': _passwordController.text,
    };

    try {
      final response = await dio.post(
        apiUrl,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: requestBody,

      );


      if (response.statusCode == 200) {
        final responseData = response.data;
        final token = responseData['access'];

        // Almacenar token en SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwt_token', token);

        Navigator.pushNamed(context, '/perfil_cliente');
       /* Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PerfilMiClienteView()),
        );*/
      } else {
        // Manejar errores de inicio de sesión aquí
        final errorMessage = response.data['detail'];
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error al iniciar sesión'),
              content: Text(errorMessage),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Aceptar'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Manejar errores de red o excepciones aquí
      print('Error de red: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _enviarFormulario,
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}*/



/*import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class IniciarSesionPage extends StatefulWidget {
  @override
  _IniciarSesionPageState createState() => _IniciarSesionPageState();
}

class _IniciarSesionPageState extends State<IniciarSesionPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _enviarFormulario() async {
    final dio = Dio();
    final cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));

    final String apiUrl = 'http://192.168.137.1/api/token/';
    final Map<String, dynamic> requestBody = {
      'username': _usernameController.text,
      'password': _passwordController.text,
    };

    try {
      final response = await dio.post(
        apiUrl,
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: requestBody,
      );

      if (response.statusCode == 200) {
        final responseData = response.data;
        final token = responseData['access'];

        // Almacenar token en SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('jwt_token', token);

        // Redirigir automáticamente al perfil del cliente
        Navigator.pushReplacementNamed(context, '/perfil_cliente');
      } else {
        // Manejar errores de inicio de sesión aquí
        final errorMessage = response.data['detail'];
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error al iniciar sesión'),
              content: Text(errorMessage),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Aceptar'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Manejar errores de red o excepciones aquí
      print('Error de red: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _enviarFormulario,
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IniciarSesionPage extends StatefulWidget {
  @override
  _IniciarSesionPageState createState() => _IniciarSesionPageState();
}

class _IniciarSesionPageState extends State<IniciarSesionPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _enviarFormulario() async {
    final String apiUrl = 'http://192.168.137.1/api/token/';
    final Map<String, dynamic> requestBody = {
      'username': _usernameController.text,
      'password': _passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final token = responseData['access'];

        // Almacenar token en SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        print('Este es el token');
        print(prefs);
        prefs.setString('jwt_token', token);
        print('Token JWT almacenado: $token');

        // Redirigir automáticamente al perfil del cliente
        Navigator.pushReplacementNamed(context, '/perfil_cliente');
      } else {
        // Manejar errores de inicio de sesión aquí
        final errorMessage = json.decode(response.body)['detail'];
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error al iniciar sesión'),
              content: Text(errorMessage),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Aceptar'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      // Manejar errores de red o excepciones aquí
      print('Error de red: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _enviarFormulario,
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}




