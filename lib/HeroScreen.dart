import 'package:flutter/material.dart';

class Heroanimation extends StatefulWidget {
  const Heroanimation({Key? key}) : super(key: key);

  @override
  _HeroanimationState createState() => _HeroanimationState();
}

class _HeroanimationState extends State<Heroanimation> {
  bool isInstructionView = false;
  double _scale = 1.0;
  double _previousScale = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
       
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.video_call),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.call),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
             onScaleStart: (ScaleStartDetails details) {
                // print(details);
                _previousScale = _scale;
                setState(() {});
              },
              onScaleUpdate: (ScaleUpdateDetails details) {
                // print(details);
                _scale = _previousScale * details.scale;
                setState(() {});
              },
              onScaleEnd: (ScaleEndDetails details) {
                // print(details);
                _previousScale = 1.0;
                setState(() {});
              },

            child: Hero(
              tag: "profile-image",
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: AssetImage("assets/salman.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Vikash Pandey",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        "Last seen At 12:30",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.grey,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Info",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "+9811654613",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "Mobile",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.grey,
            child: ListTile(
              title: Text(
                "Notification",
                style: TextStyle(color: Colors.white),
              ),
              subtitle: isInstructionView == true
                  ? Text(
                      "On",
                      style: TextStyle(color: Colors.white),
                    )
                  : Text(
                      "Off",
                      style: TextStyle(color: Colors.white),
                    ),
              trailing: Switch(
                value: isInstructionView,
                onChanged: (bool isOn) {
                  setState(() {
                    isInstructionView = isOn;
                    print(isInstructionView);
                  });
                },
                activeColor: Colors.blue,
                inactiveTrackColor: Colors.white,
                inactiveThumbColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
