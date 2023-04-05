import 'package:flutter/material.dart';

class cleaningRegister extends StatefulWidget {
  const cleaningRegister({Key? key}) : super(key: key);

  @override
  State<cleaningRegister> createState() => _cleaningRegisterState();
}

class _cleaningRegisterState extends State<cleaningRegister> {

  String? valueChoose;
  List<String> listItem =['11AM - 12PM','12PM - 1PM','1PM - 2PM','2PM-3PM','3PM - 4PM'];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/register.png'),fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 70,top:10),
              child: const Text('Choose Time Slot', style: TextStyle(
                  color: Colors.white,
                  fontSize: 33),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(110, 150, 100, 100),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    Navigator.pushNamed(context, 'ScanQR');
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 4, 5, 4),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 35,
                        color: Color(0xff4c505b),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                child: Row(
                  children: [
                    SizedBox(height:1100 ,),
                    SizedBox(width: 65,),
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
                    SizedBox(width: 50,),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xff4c505b),
                      child: IconButton(
                        onPressed: () async {
                          Navigator.pushNamed(context, 'ScanQR');
                        },
                        icon: Icon(Icons.qr_code,color: Colors.white,),
                      ),
                    ),
                    SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.25,
                        right: 35,
                        left: 35),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        padding: EdgeInsets.only(left:16, right:16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: DropdownButton(
                          hint: Text("Select Time Slot",style: TextStyle(color: Colors.black),),
                          dropdownColor: Colors.white,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 40,
                          isExpanded: true,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22
                          ),
                          value: valueChoose,
                          onChanged: (newValue){
                            setState(() {
                              valueChoose = newValue as String?;
                            });
                          },
                          items: listItem.map((valueItem){
                            return DropdownMenuItem(
                              value: valueItem,
                                child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                 ),
                ],
              )
            )],

        ),
      ),
    );
  }
}
