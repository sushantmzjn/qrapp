import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrGenerator extends StatefulWidget {
  const QrGenerator({Key? key}) : super(key: key);

  @override
  State<QrGenerator> createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  String data = "";
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff6998ab),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImage(
              data: data,
              foregroundColor: const Color(0xff000000),
              backgroundColor: Colors.transparent,
              size: 250.0,
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            width: 300,
            height: 45.0,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextField(
              controller: textController,
              textAlign: TextAlign.left,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  // icon: Icon(Icons.edit),
                  prefixIcon: Icon(
                    Icons.edit,
                    size: 20.0,
                    color: Color(0xff6998ab),
                  ),
                  hintStyle:
                      TextStyle(fontSize: 16.0, color: Colors.deepPurple[300]),
                  hintText: "Input text to generate QR"),
              onChanged: (value) {
                setState(() {
                  data = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
