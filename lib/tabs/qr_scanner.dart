import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (controller != null && mounted) {
      controller!.pauseCamera();
      controller!.resumeCamera();
    }
    return Container(
        color: const Color(0xff406882),
        child: Stack(
          alignment: Alignment.center,
          children: [
            buildQrView(context),
            Positioned(bottom: 20, child: buildResult())
          ],
        ));
  }

  Widget buildResult() => Container(
        decoration: BoxDecoration(
            color: Colors.white70, borderRadius: BorderRadius.circular(10.0)),
        padding: const EdgeInsets.all(10.0),
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            result != null ? 'res : ${result!.code}' : 'Scan a code',
            maxLines: 3,
            style: const TextStyle(fontSize: 20.0),
          ),
        ),
      );

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderRadius: 8.0,
            borderLength: 30.0,
            borderWidth: 10.0,
            borderColor: Colors.green,
            cutOutSize: MediaQuery.of(context).size.width * 0.7),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}
