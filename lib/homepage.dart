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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('QR Scanner/Generator'),
          centerTitle: true,
          elevation: 1,
          actions: [
            IconButton(
              onPressed: () {
                print('btn clcked');
              },
              icon: Icon(Icons.info_outline_rounded),
              splashRadius: 20.0,
              splashColor: Colors.deepPurple[600],
            )
          ],
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(20.0))),
          bottom: TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
            Tab(
              child: Text(
                'QR Generator',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                'QR Scanner',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ]),
        ),
        body: Column(
          children: [
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
