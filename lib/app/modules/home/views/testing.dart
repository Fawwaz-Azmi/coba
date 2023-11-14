import 'package:flutter/material.dart';

class Testing extends StatelessWidget {
  const Testing({super.key, required this.data});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data),
      ),
    );
  }
}
