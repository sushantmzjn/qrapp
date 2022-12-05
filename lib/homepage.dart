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
          backgroundColor: Color(0xff5f9df7),
          title: const Text('QR Scanner/Generator'),
          centerTitle: true,
          elevation: 0.5,
          actions: [
            IconButton(
              onPressed: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            size: 50.0,
                          ),
                          const Text(
                            'About',
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('close'),
                            style: ElevatedButton.styleFrom(
                                elevation: 6.0, backgroundColor: Colors.red),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              icon: Icon(Icons.info_outline_rounded),
              splashRadius: 25.0,
              splashColor: Colors.lightBlueAccent,
            )
          ],
          shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(15.0))),
          bottom: TabBar(
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
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
