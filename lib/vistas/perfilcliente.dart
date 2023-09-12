import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilMiClienteView extends StatefulWidget {
  @override
  _PerfilMiClienteViewState createState() => _PerfilMiClienteViewState();
}

class _PerfilMiClienteViewState extends State<PerfilMiClienteView> {
  Map<String, dynamic> _perfilData = {};

  Future<void> _obtenerPerfil() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('jwt_token') ?? '';

    final response = await http.get(
      Uri.parse('http://192.168.137.1/perfil_cliente'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $authToken',

      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        _perfilData = jsonResponse;
      });
    } else if (response.statusCode == 302) {
      // La respuesta redirige a otra URL (manejar según tu lógica)
      final redirectUrl = response.headers['location'];
      if (redirectUrl != null) {
        await launch(redirectUrl);
      }
    } else {
      // Manejar otros errores de obtención de perfil aquí
    }
  }

  @override
  void initState() {
    super.initState();
    _obtenerPerfil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('Perfil de Cliente'),
      ),
      body: Center(
        child: _perfilData.isNotEmpty
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Nombre: ${_perfilData['nombre']}'),
            Text('Apellido: ${_perfilData['apellido']}'),
            Text('Correo: ${_perfilData['correo']}'),
            Text('Celular: ${_perfilData['celular']}'),
          ],
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}
