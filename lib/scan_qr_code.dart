import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_code/splash.dart';

class ScanQRCode extends StatefulWidget {
  const ScanQRCode({super.key});

  @override
  State<ScanQRCode> createState() => _ScanQRCodeState();
}

class _ScanQRCodeState extends State<ScanQRCode> {
  String qrResult = 'SCanned Data will Appear';
  Future<void> scanQR()async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        qrResult = qrCode.toString();
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ListFilter(name: qrResult)));
      });
    }on PlatformException{
      qrResult = 'Fail to read QR Code';

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Scanner'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            Text(qrResult, style: const TextStyle(color: Colors.black),),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: scanQR, child: const Text('Scan Code'))
          ],
        ),
      ),
    );
  }
}
