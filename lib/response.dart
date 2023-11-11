import 'package:flutter/material.dart';

class Response extends StatelessWidget {
  final String texto;
  final void Function() whenSelected;

  Response(this.texto, this.whenSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          textStyle: MaterialStateProperty.all(TextStyle(fontSize: 30))),
       child: Text(texto),
        onPressed: whenSelected,
      )
    );
  }
}
