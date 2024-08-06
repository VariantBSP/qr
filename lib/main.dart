import 'package:flutter/material.dart';
import 'package:qr_code/detale.dart';
import 'package:qr_code/file.dart';
import 'package:qr_code/generate_qr_code.dart';
import 'package:qr_code/scan_qr_code.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tree Tutor',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override

  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        shape: const CircleBorder(),
        fixedSize: const Size(180, 200),
        backgroundColor: Colors.white
    );

    return Scaffold(
      backgroundColor: const Color(0xFF012B09),
      appBar: AppBar(
        backgroundColor: const Color(0xFF012B09),
        title: const Text('QR Code',  style:TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: style,
                  onPressed: (){
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ScanQRCode()));
                    });
                  },
                  child: const Icon(Icons.qr_code_scanner_rounded, size: 130, color: Colors.black,)
              ),
              const SizedBox(height: 40,),
              const Text('Click to Scan QR', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),

/*              const SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Firepage()));
                });
              }, child: const Text('Details', style: TextStyle(color: Colors.black))),
              ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const GenerateQRCode()));
                });
              }, child: const Text('Generate QR Code', style: TextStyle(color: Colors.black))),
              const SizedBox(height: 40,),
              ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Details()));
                });
              }, child: const Text('fire', style: TextStyle(color: Colors.black)))  */
            ],
          ),
        ),
      ),
    );
  }
}
