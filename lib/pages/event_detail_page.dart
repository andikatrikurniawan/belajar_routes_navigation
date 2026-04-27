import 'package:flutter/material.dart';
import 'package:flexible_wrap/flexible_wrap.dart';
import'package:go_router/go_router.dart';

class EventDetailPage extends StatefulWidget {
  const EventDetailPage({super.key});

  @override
  State<EventDetailPage> createState() => _EventDetailPageState();
}

class _EventDetailPageState extends State<EventDetailPage> {
  final double spacing = 12.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Event Detail Page"),
      ),
      body: Column(
        children: [
          SizedBox(height: 14),
           ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shadowColor: Colors.indigo,
              elevation: 5,
              padding: EdgeInsets.all(12.00),
            ),
            onPressed: (){
              context.go("/homePage/event/detail/flexible");
            }, 
            child: Text("Go to Event Flexible >>"),
          ),
          SizedBox(height: 14),
          Expanded(
            child: SingleChildScrollView(
              child: FlexibleWrap(
                spacing: spacing,
                runSpacing: spacing,
                textDirection: TextDirection.rtl,
                children: List.generate(20, (int index) {
                  return Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(8.0)),
                    child: ListTile(
                      title: Text(
                        "Lorem Ipsum is simply dummy text",
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        "Lorem Ipsum has been the industry's standard",
                        style: TextStyle(color: Colors.white),
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: Icon(
                        Icons.insert_emoticon,
                        color: Colors.white,
                        size: 60.0,
                      ),
                      trailing: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                  );
                }).toList(),
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}