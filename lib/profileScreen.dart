import 'package:flutter/material.dart';
import 'package:test/HeroScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isInstructionView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        child: Icon(Icons.chat),
        onPressed: () {},
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
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
          Material(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Heroanimation()),
                );
              },
              child: Hero(
                tag: "profile-image",
                child: Container(
                  color: Colors.blueGrey,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: ListTile(
                    leading: Container(
                      // width: 100,
                      // height: 100,
                      decoration: BoxDecoration(
                          color: Colors.amber, shape: BoxShape.circle),
                      child: ClipOval(
                          child: Image.asset("assets/salman.jpeg",
                              fit: BoxFit.fill)),
                    ),
                    title: Text(
                      "Vikash Pandey",
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text("Last Seen At 13:34",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.grey, border: Border.all(color: Colors.white,)),
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
            decoration: BoxDecoration(
                color: Colors.grey, border: Border.all(color: Colors.white)),
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
