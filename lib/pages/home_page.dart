import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Routes"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Configuration Routes",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              ),
              ElevatedButton(
                onPressed: (){
                  context.go("/product-detail/123?barang=laptop&stock=200");
                }, 
                child: Text("Go to Product Detail >>"),
                ),
            ],
          ),
      ),
        
    );
  }
}