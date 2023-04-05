import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({Key? key}) : super(key: key);

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  late TextEditingController _textController;
  late String _qrData;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _qrData = '';
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _generateQRCode() {
    setState(() {
      _qrData = _textController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
        backgroundColor: Color(0xff4c505b),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: QrImage(
                data: _qrData,
                version: QrVersions.auto,
                gapless: false,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 250,
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Enter text or URL',
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateQRCode,
              child: Text('Generate QR Code'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xff4c505b), // Set the background color of the button
              ),
            ),
            SizedBox(height: 80),
            SingleChildScrollView(
              child: Container(
                child: Row(
                  children: [
                    SizedBox(height:10 ,),
                    SizedBox(width: 65,),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'cleaningRegister');
                        },
                        icon: Icon(Icons.cleaning_services,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 50,),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'homePage');
                        },
                        icon: Icon(Icons.home,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 50,),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'profile');
                        },
                        icon: Icon(Icons.person,color: Colors.white,),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
