import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductDetailEdit extends StatefulWidget {
  const ProductDetailEdit({
    super.key, 
    required this.id,
    required this.barang,
     }
    );

  final String id;
  final String barang;

  @override
  State<ProductDetailEdit> createState() => ProductDetailEditState();
}

class ProductDetailEditState extends State<ProductDetailEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Edited"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Flat Routes",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 20),
              Text("Edited ID Product : ${widget.id}"),
              Text("Edited Name Barang : ${widget.barang}"),
              SizedBox(height: 14),
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