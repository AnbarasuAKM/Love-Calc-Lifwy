import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:lifwy/homescreen.dart';
class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {

  TextEditingController numberCtrl=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6060),
        title: Text("Call"),
        leading: IconButton(onPressed: (){
          Navigator.pop(context,MaterialPageRoute(builder: (context)=>homescreen()));
        }, icon: Icon(Icons.arrow_back_ios_sharp)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: numberCtrl,
              decoration: const InputDecoration(labelText: "Phone Number",
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.pink,
                ),
              )),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.pink),
            ),
            child: const Text("Test Call"),
            onPressed: () async {
              FlutterPhoneDirectCaller.callNumber(numberCtrl.text);
            },
          ),
          SizedBox(
            height: 100,
            width: 280,
            child: Card(
              elevation: 5,
            ),
          ),
        ],
      ),
    );

  }
}
