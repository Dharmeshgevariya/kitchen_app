import 'package:flutter/material.dart';

class sale extends StatefulWidget {
  const sale({Key? key}) : super(key: key);

  @override
  State<sale> createState() => _saleState();
}

class _saleState extends State<sale> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Sale"),
    );
  }
}
