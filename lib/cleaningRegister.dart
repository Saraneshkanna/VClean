import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class cleaningRegister extends StatefulWidget {
  const cleaningRegister({Key? key}) : super(key: key);

  @override
  State<cleaningRegister> createState() => _cleaningRegisterState();
}

class _cleaningRegisterState extends State<cleaningRegister> {

  late List<String> _timeSlots;
  String? _selectedTimeSlot;
  String name = "";
  String roomNo = "";
  CollectionReference slotsCollection =  FirebaseFirestore.instance.collection('TimeSlots');

  @override
  void initState() {
    super.initState();
    _getTimeSlots();
  }

  void _getTimeSlots() async {
    final DocumentSnapshot document = await slotsCollection.doc('available').get();
    final List<dynamic> slots = document.get('slots');
    _timeSlots = List<String>.from(slots);
    setState(() {});
  }
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  final CollectionReference roomsCollection =
  FirebaseFirestore.instance.collection('cleanRequests');

  Future<void> updateFirestore() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final DocumentSnapshot userSnapshot =
      await usersCollection.doc(user.uid).get();
      setState(() {
        name = userSnapshot.get('name');
        roomNo = userSnapshot.get('roomNo');
      });
      final roomsDoc = await roomsCollection.doc(roomNo).get();
      if(!roomsDoc.exists) {
        await roomsCollection.doc(roomNo).set({
          'Name': name,
          'Time Slot': _selectedTimeSlot,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Room registered for cleaning!',style: TextStyle(
              fontSize: 20, // set font size to 24
              color: Colors.black,
            ),),
            backgroundColor: Colors.lightGreenAccent,
            duration: Duration(seconds: 5),
          ),
        );
        _selectedTimeSlot = null;
      }
      else
        {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Your room has already been registered for cleaning',style: TextStyle(
                fontSize: 20, // set font size to 24
              ),),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 5),
            ),
          );
        }
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
            // Text(
            //   "Room: " + roomNo,
            //   style: TextStyle(
            //     color: Color(0xff4c505b),
            //     fontWeight: FontWeight.bold,
            //     fontSize: 33,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
