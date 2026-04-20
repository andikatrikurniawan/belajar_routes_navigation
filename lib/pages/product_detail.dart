import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, required this.id, required this.barang, required this.stock});

  final String id;
  final String barang;
  final String stock;

  @override
  State<ProductDetailPage> createState() => ProductDetailPageState();
}

class ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Detail"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
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
              SizedBox(height: 20),
              Text("ID Product : ${widget.id}"),
              Text("Nama Barang : ${widget.barang}"),
              Text("Stock Barang : ${widget.stock}"),
              ElevatedButton(
                onPressed: (){
                  context.go("/homePage");
                }, 
                child: Text("<< Back to Home Page"),
                ),
            ],
          ),
      ),
        
    );
  }
}