import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class cleaningRegister extends StatefulWidget {
  const cleaningRegister({Key? key}) : super(key: key);

  @override
  State<cleaningRegister> createState() => _cleaningRegisterState();
}

class _cleaningRegisterState extends State<cleaningRegister> {

  String? _selectedTimeSlot;
  String name = "";
  String roomNo = "";
  final List<String> _timeSlots = [
    '11AM - 12PM',
    '12PM - 1PM',
    '1PM - 2PM',
    '2PM-3PM',
    '3PM - 4PM',
    '4PM - 5PM'
  ];

  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<void> updateFirestore() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final DocumentSnapshot userSnapshot =
      await usersCollection.doc(user.uid).get();
      setState(() {
        name = userSnapshot.get('name');
        roomNo = userSnapshot.get('roomNo');
      });

      await FirebaseFirestore.instance.collection('cleanRequests').doc(roomNo).set({
        'Name': name,
        'Time Slot': _selectedTimeSlot,
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Time Slot'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _selectedTimeSlot,
              hint: const Text('Select a time slot'),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTimeSlot = newValue;
                });
              },
              items: _timeSlots.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                updateFirestore();
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Room: " + roomNo,
              style: TextStyle(
                color: Color(0xff4c505b),
                fontWeight: FontWeight.bold,
                fontSize: 33,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
