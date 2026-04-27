import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final myAppbar = AppBar(
        title: Text("Events Page"),
        centerTitle: true,
        backgroundColor: Colors.green,
      );
      final bodyHeight = mediaQueryHeight - myAppbar.preferredSize.height - MediaQuery.of(context).padding.top;
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      appBar: myAppbar,
      body: SafeArea(
        child: (isLandscape)
        ? Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Nested Routes",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                ),
                ElevatedButton(
                  onPressed: (){
                    context.go("/homePage/event/detail");
                  }, 
                  child: Text("Go to Event Detail >>"),
                  ),
                SizedBox(height: 14),  
                Container(
                  width: mediaQueryWidth - 50,
                  height: bodyHeight * 0.2,
                  color: Colors.green,
                ),
                SizedBox(height: 14),
                 Container(
                  height:bodyHeight * 0.5,
                  width: mediaQueryWidth - 50,
                  color: Colors.black,
                   child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                     ),
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return GridTile(
                          child: Container(
                            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256) , Random().nextInt(256)
                            ),
                          ),
                        );
                      },
                      ),
                    ), 
              ],
            ),
        )
      : Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Nested Routes",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                ),
                ElevatedButton(
                  onPressed: (){
                    context.go("/homePage/event/detail");
                  }, 
                  child: Text("Go to Event Detail >>"),
                  ),
                SizedBox(height: 14),  
                Container(
                  width: mediaQueryWidth - 40,
                  height: bodyHeight * 0.2,
                  color: Colors.green,
                ),
                SizedBox(height: 14),
                 Container(
                  height:bodyHeight * 0.4,
                  width: mediaQueryWidth - 40,
                  color: Colors.greenAccent,
                   child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                     ),
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return GridTile(
                          child: Container(
                            color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256) , Random().nextInt(256)
                            ),
                          ),
                        );
                      },
                      ),
                    ), 
              ],
            ),
        ),
      ),
        
    );
  }
}