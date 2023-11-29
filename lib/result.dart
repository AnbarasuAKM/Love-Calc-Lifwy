import 'package:flutter/material.dart';
import 'package:lifwy/flames.dart';
import 'package:percent_indicator/percent_indicator.dart';
class Result extends StatefulWidget {
   const Result({Key? key, required this.yourName, required this.partnerName, required this.percentage, }) : super(key: key);
  final String yourName;
  final String partnerName;
  final double percentage;
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  var message=" ";

  
@override
  initState() {
    // TODO: implement initState
    super.initState();
    if (widget.percentage>=80){
      message="You are Made for Each other";
      print(message);
    }
    else if(widget.percentage>=70&& widget.percentage <=80 ){
      message="Tonight i will took up the Moon\n and I with know that \n somewhere you are looking at it too..";
      print(message);
    }
    else if (widget.percentage>=50 && widget.percentage>=70){
      message="You Guys are Really Awesome";
      print(message);
    }
    else if(widget.percentage>=40 && widget.percentage<=50){
      message="You try other one";
      print(message);
    }
    else if(widget.percentage>=30 && widget.percentage<=40){
      message="Crush";
      print(message);
    }
    else if (widget.percentage>=0.5 && widget.percentage<=30){
      message="Affection";
      print(message);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF6060),
        title: Text("Love Score",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize:24,
          fontFamily: "Winter"
        ),),
        leading: IconButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black),
          ),            onPressed: (){
            Navigator.pop(context,Flames());
        }, icon: Icon(Icons.arrow_back_ios_sharp,color: Colors.white,)),
      ),
      backgroundColor: Color(0xFFFF6060),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("asset/image/fbg.jpg"),fit: BoxFit.cover)
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(widget.yourName,style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Love",
                ),),
                SizedBox(
                  height: 25,
                  child: Icon(Icons.favorite,color: Colors.blue,size: 30,),
                ),
                Text(widget.partnerName,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,color: Colors.black87,
                ),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Center(
                child: CircularPercentIndicator(
                  backgroundColor: Colors.white,
                  animation:true,
                  radius: 100.0,
                center: Text(widget.percentage.toString(),style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                lineWidth: 20,
                percent: widget.percentage/100,
                progressColor: Color(0xFFFF6060),
                circularStrokeCap: CircularStrokeCap.round,
                animationDuration: 1200,
                  onAnimationEnd: (){
                    print("Animation finished");
                  },
                ),
              ),
            ),
             SizedBox(
               height: 130,
                 width: 360,
                 child: Card(
                   child: Center(child: Text(message.toString(),style: TextStyle(fontSize: 19,
                   fontWeight: FontWeight.bold,
                   color: Color(0xFFFF6060)),)),
                   elevation: 10,
                 )),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context,Flames());
              },
              child: Container(
                height: 50,
                width:150,
              decoration: BoxDecoration(
                color: Color(0xFFFF6060),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text("Try Again",style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 20),),
              ),),
            ),

          ],
        ),
      ),
    );
  }
}
