import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class RegistrarUsuarioView extends StatefulWidget {
  @override
  _RegistrarUsuarioViewState createState() => _RegistrarUsuarioViewState();
}

class _RegistrarUsuarioViewState extends State<RegistrarUsuarioView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _documentoController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =TextEditingController();
  final TextEditingController _rolController = TextEditingController();

  File? _image;

  /*Future<void> _pickImage() async {
    final pickedImage =
    await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }*/

  void _pickImage() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  /*void pickkk() async{
    final piki=await ImagePicker().getImage(source: ImageSource.gallery);
    //final pickedImage = await ImagePicker.pik(source: ImageSource.gallery);
  }*/



  void _enviarFormulario() async {
    if (_formKey.currentState!.validate()) {
      if (_passwordController.text == _confirmPasswordController.text) {
        final String apiUrl = 'http://192.168.137.1/registro/';
        final Map<String, dynamic> requestBody = {
          'documento': _documentoController.text,
          'username': _usernameController.text,
          'email': _emailController.text,
          'password1': _passwordController.text,
          'password2': _confirmPasswordController.text,
          'rol': _rolController.text,
          'imagen': _image != null ? base64Encode(_image!.readAsBytesSync()) : null,
        };

        print("Datos enviados desde Flutter:");
        print(requestBody); // Imprime el contenido de requestBody

        final respuesta = await http.post(
          Uri.parse(apiUrl),
          headers: {'content-type': 'application/json'},
          body: json.encode(requestBody),
        );

        if (respuesta.statusCode == 200) {
          print("Usuario registrado correctamente");
          // Puedes redirigir a otra página o mostrar un mensaje de éxito
        } else {
          print("Error al registrar el usuario");
        }
      } else {
        // Las contraseñas no coinciden, muestra un mensaje de error
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Las contraseñas no coinciden.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Aceptar'),
                ),
              ],
            );
          },
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Usuario')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _documentoController,
                  decoration: InputDecoration(labelText: 'Documento'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa el documento';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Nombre de Usuario'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa un nombre de usuario';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Correo Electrónico'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa un correo electrónico';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Contraseña'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa una contraseña';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration:
                  InputDecoration(labelText: 'Confirmar Contraseña'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor confirma la contraseña';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _rolController,
                  decoration: InputDecoration(labelText: 'Rol'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa un rol';
                    }
                    return null;
                  },
                ),
                _image != null
                    ? Image.file(_image!, height: 200, width: 300)
                    : Container(),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Seleccionar Imagen'),
                ),
                ElevatedButton(
                  onPressed: _enviarFormulario,
                  child: Text('Registrar Usuario'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
