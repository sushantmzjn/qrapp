import 'package:flutter/material.dart';
import 'package:qrapp/tabs/qr_generator.dart';
import 'package:qrapp/tabs/qr_scanner.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('QR Scanner/Generator'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TabBar(tabs: [
              Tab(
                child: Text(
                  'QR Generator',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
              Tab(
                child: Text(
                  'QR Scanner',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ]),
            Expanded(
              child: TabBarView(children: [
                QrGenerator(),
                QrScanner(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
