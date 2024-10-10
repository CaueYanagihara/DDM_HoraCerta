import 'package:flutter/material.dart';

class PaginaInicio extends StatelessWidget{
  const PaginaInicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.pushNamed(context, '/cadastro');
          }, 
          child: Text('Iniciar Cadastro')
        ),
      ),
    );
  }
}