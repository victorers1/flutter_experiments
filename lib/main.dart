import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as dev;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _cardScanOptions = const CardScanOptions(
    enableDebugLogs: true,
    scanCardHolderName: true,
    scanExpiryDate: true,
    cardScannerTimeOut: 30000,
  );

  String cardDetails = 'Nenhum cartão';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                var cardDetails = await CardScanner.scanCard(
                  scanOptions: _cardScanOptions,
                );
                setState(() {
                  this.cardDetails = cardDetails.toString();
                });
                dev.log(this.cardDetails);
              },
              child: const Text('Analisar Cartão'),
            ),
            const SizedBox(height: 40),
            Text(
              cardDetails,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
