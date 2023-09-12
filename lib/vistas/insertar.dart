import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;




class InsertarClinete extends StatefulWidget {
  const InsertarClinete({Key? key}) : super(key: key);

  @override
  State<InsertarClinete> createState() => _InsertarClineteState();
}

class _InsertarClineteState extends State<InsertarClinete> {
  final GlobalKey<FormState> _formulario= GlobalKey<FormState>();
  final TextEditingController _documentoController=TextEditingController();
  final TextEditingController _nombreController=TextEditingController();
  final TextEditingController _apellidoController=TextEditingController();
  final TextEditingController _correoController=TextEditingController();
  final TextEditingController _celularController=TextEditingController();


 void enviarformulario() async{
   if(_formulario.currentState!.validate()){
     print("EN EL FORMULARIO");
     final String apiUrl='http://192.168.137.1/insertar/';

     final Map<String, dynamic> requestBody={
       'documento':_documentoController.text,
       'nombre':_nombreController.text,
       'apellido':_apellidoController.text,
       'correo':_correoController.text,
       'celular':_celularController.text,
     };
     print('Valor del campo documento: ${requestBody['documento']}');
     print('Valor del campo documento: ${requestBody['nombre']}');
     print('Valor del campo documento: ${requestBody['apellido']}');
     print('Valor del campo documento: ${requestBody['correo']}');
     print('Valor del campo documento: ${requestBody['celular']}');
     final respuesta=await http.post(Uri.parse(apiUrl),
     headers: {'content-type':'application/json'},
         body:json.encode(requestBody),


     );
      print(respuesta.statusCode);
     if(respuesta.statusCode==200){
       print("Datos se enviaron correcatamente");
     }
     else{
       print("Datos no se enviaron");
     }
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formulario,
            child: Column(
              children: [
               TextFormField(
                controller: _documentoController,
                 decoration: InputDecoration(labelText: 'Documento'),
                 validator: (value){
                  if(value!.isEmpty){
                    return 'Por favor ingresar informaciónb';
                  }
                  return null;
                 },
            ),
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(labelText: ' nombre'),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Por favor ingresar informaciónb';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _apellidoController,
                  decoration: InputDecoration(labelText: 'apellido'),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Por favor ingresar informaciónb';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _correoController,
                  decoration: InputDecoration(labelText: 'correo'),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Por favor ingresar informaciónb';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _celularController,
                  decoration: InputDecoration(labelText: 'celular'),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Por favor ingresar informaciónb';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 20,),
                ElevatedButton(onPressed: enviarformulario,
                    child: Text('Registrar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
