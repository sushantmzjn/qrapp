import 'package:flutter/material.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
        child: Center(child: Text('2st tab'))
    );
  }
}
