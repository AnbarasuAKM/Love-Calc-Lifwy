import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lifwy/call.dart';
import 'package:lifwy/flames.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  static const List<String> pic = [
    "asset/image/lvr.jpg",
    "asset/image/nature.jpg",
    "asset/image/yoga.jpg",
    "asset/image/date.webp",
    "asset/image/Moti.jpg"
  ];

  var y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(
          0xFFFF6060,
        ),
        actions: [
          SizedBox(width: 60, child: Icon(Icons.search)),
          SizedBox(width: 50, child: Icon(Icons.notifications)),
          SizedBox(width: 60, child: Icon(Icons.payment)),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFFF6060), Color(0xFFC829C8)]),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 180,
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                              Text(
                                "Chat with your \nAstrolger",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          color: Colors.pink,
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 180,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Call()));
                          },
                          child: Card(
                            color: Color(0xFFC829C8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.settings_phone_outlined,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Call with your \nHim or Her",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            left: 04,
            top: 120,
            child: Column(
              children: [
                SizedBox(
                    height: 160,
                    width: 380,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Flames()));
                      },
                      child: Card(
                        elevation: 4,
                        color: Colors.white54,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Know your love\ncompatibility',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink,
                                  ),
                                ),
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage("asset/image/spls.png"),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  homescreen()));
                                    },
                                    child: Text(
                                      "Click here Down",
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Icon(Icons.arrow_downward_outlined),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Positioned(
            top: 300,
            child: Column(
              children: [
                FanCarouselImageSlider(
                  initalPageIndex: 0,
                  sliderHeight: 300,
                  sliderWidth: 380,
                  imagesLink: pic,
                  userCanDrag: true,
                  isAssets: true,
                  autoPlay: true,
                ),
                // BottomNavigationBar(
                //     currentIndex: y,
                //     onTap: (tap) {
                //       setState(() {
                //         y = tap;
                //       });
                //     },
                //     items: BottomNavigationBarItem[BottomNavigationBarItem(
                //  ,,
                //  icon: Icons.home, label: "Home")]),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        backgroundColor: Color(0xFFC829C8),
        unselectedItemColor: Color(0xFFC829C8),
        selectedItemColor: Colors.pink,
        onTap: (tap){
          setState(() {
            y=tap;
          });
        },
        currentIndex: y,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note),label: "Music"),
          BottomNavigationBarItem(icon: Icon(Icons.supervisor_account),label: "Quotes"),

        ],
      ),
    );
  }

  no1() {
    return Container(
      height: 150,
      width: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFFF6060),
      ),
    );
  }

  no2({BoxBorder? border}) {
    return Container(
      height: 80,
      width: 180,
      decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(20),
          color: Color(0xFFC829C8)),
    );
  }

  no3() {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFFFF6060),
      ),
    );
  }
}
