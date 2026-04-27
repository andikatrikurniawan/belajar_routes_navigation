import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/material.dart';

class FlexsiblePage extends StatelessWidget {
  const FlexsiblePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flexible Page"),
        backgroundColor: Colors.purple.shade400,
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Fitur belum tersedia")),
              );
            },
            icon: Icon(Icons.notification_add_rounded),
           ),
        ],
      ),
      body:SafeArea(
        child: SingleChildScrollView(
          child: FlexibleWrap(
            spacing: 12,
            runSpacing: 12,
            children: List.generate(20,(index){
            return SizedBox(
              width:300,
              child: Card(
                elevation:4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.network(
                        "https://picsum.photos/300/200?random=$index",
                        height:180,
                        width:300,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Lorem ipsum dolor sit amet consectetur adipiscing elit.",
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          ),
        ),
      ), 
    );
  }
}