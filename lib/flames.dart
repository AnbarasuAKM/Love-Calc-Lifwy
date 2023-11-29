import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lifwy/result.dart';

class Flames extends StatefulWidget {
  const Flames({Key? key}) : super(key: key);

  @override
  State<Flames> createState() => _FlamesState();
}

class _FlamesState extends State<Flames> {
  TextEditingController yournName = TextEditingController();
  TextEditingController partnerName = TextEditingController();
  late String firstName, secondName;
  var percentage;
  var message;



  void erase() {
    setState(() {
      percentage = "";
      yournName.clear();
      partnerName.clear();
    });
  }

  void loveCalc() {
    setState(() {
      if (yournName.text.isNotEmpty && yournName.text.isNotEmpty) {
        firstName = yournName.text;
        secondName = partnerName.text;
        message="";

        var sum1 = sumCalc(firstName);
        var sum2 = sumCalc(secondName);
        print(sum1);
        print(sum2);
        var totalSum = sum1 + sum2;
        print(totalSum);
        percentage = totalSum/2*4;
        print(percentage);
      }
    });
  }

  int sumCalc(String s) {
    var sum = 0;
    for (int i = 0; i < s.length; i++) {
      sum +=i;
    }
    return sum;
  }
  void reset(){
    setState(() {
      yournName.text ='' ;
      partnerName.text='' ;
    });
  }

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF6060),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/image/fbg.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Love Calc",
                    style: TextStyle(
                      fontFamily: "Winter",
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: 80,
                      width: 300,
                      child: TextField(
                        controller: yournName,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                          fillColor: const Color(0xFFFF6060),
                          filled: true,
                          hintText: "Enter Your FullName",
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.pink,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(00),
                    child: SizedBox(
                      height: 80,
                      width: 300,
                      child: TextField(
                        controller: partnerName,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink)),
                          fillColor: const Color(0xFFFF6060),
                          filled: true,
                          hintText: "Enter Your PartnerName",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SizedBox(
                            height: 50,
                            width: 120,
                            child: Card(
                              color: Color(0xFFFF6060),
                              child: Center(
                                child: TextButton(
                                  onPressed: (){
                                    setState(() {
                                      loveCalc();

                                      if(yournName.text.isNotEmpty&&partnerName.text.isNotEmpty){
                                        setState(() {

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Result(
                                                  yourName:yournName.text,
                                                  partnerName:partnerName.text,
                                                  percentage:percentage,
                                                ),
                                              )
                                          );
                                        });
                                      }else{
                                       setState(() {
                                         final snackBar =SnackBar(
                                           backgroundColor: Color(0xFFFF6060),
                                           elevation: 10,
                                             content: Text("Fill the Fields"));
                                         ScaffoldMessenger.of(context).showSnackBar(snackBar);

                                       });
                                      }

                                    });
                                  },
                                  child:  Text("Calculate",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),),

                                ),
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                            height: 50,
                            width: 120,
                            child: Card(
                              color: const Color(0xFFFF6060),
                              child: Center(
                                child: TextButton(
                                    onPressed: erase,
                                    child: const Text(
                                      "Clear",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    )),
                              ),
                            )),
                      ),
                    ],
                  ),
                  // IconButton(
                  //           splashColor: Color(0xFFFF6060),
                  //             onPressed: () {},
                  //             icon: Icon(
                  //               Icons.arrow_back_ios_sharp,
                  //               color: Color(0xFFFF6060),
                  //             )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
