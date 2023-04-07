import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  void SubmitFeedback() async {
    final CollectionReference usersCollection = FirebaseFirestore.instance
        .collection('users');
    final CollectionReference feedbackCollection = FirebaseFirestore.instance
        .collection('Feedback');
    final User? user = FirebaseAuth.instance.currentUser;
    String name = "";
    String roomNo = "";
    if (user != null) {
      final DocumentSnapshot userSnapshot =
      await usersCollection.doc(user.uid).get();
      setState(() {
        name = userSnapshot.get('name');
        roomNo = userSnapshot.get('roomNo');
      });
      await feedbackCollection.doc(roomNo).set({
        'Name': name,
        'Feedback': _textController.text,
        'Time': FieldValue.serverTimestamp()
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Feedback submitted successfully!",style: TextStyle(
            fontSize: 20, // set font size to 24
            color: Colors.black,
          ),),
          backgroundColor: Colors.lightGreenAccent,
          duration: Duration(seconds: 5),
        ),
      );
      _textController.text = "";
    }
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('QR Verification'),
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
                    hintText: 'Add Feedback',
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  SubmitFeedback();
                },
                child: Text('Submit Feedback'),
                style: ElevatedButton.styleFrom(
                  primary: Color(
                      0xff4c505b), // Set the background color of the button
                ),
              ),
              SizedBox(height: 80),
              SingleChildScrollView(
                child: Container(
                  child: Row(
                    children: [
                      SizedBox(height: 10,),
                      SizedBox(width: 65,),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xff4c505b),
                        child: IconButton(
                          onPressed: () async {
                            Navigator.pushNamed(context, 'cleaningRegister');
                          },
                          icon: Icon(Icons.cleaning_services,
                            color: Colors.white,),
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
                          icon: Icon(Icons.home, color: Colors.white,),
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
                          icon: Icon(Icons.person, color: Colors.white,),
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

