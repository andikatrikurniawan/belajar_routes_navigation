import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widget/method.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final queryHeight = MediaQuery.of(context).size.height;
    final queryWidth = MediaQuery.of(context).size.width;
    final paddingTop = MediaQuery.of(context).padding.top;
    final myAppbar = AppBar(
      title: Text("Routes"),
      centerTitle: true,
      backgroundColor: Colors.greenAccent,
    );
    final bodyheight = queryHeight - paddingTop - myAppbar.preferredSize.height;

    return Scaffold(
      appBar: myAppbar,
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Configuration Routes",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    showAdaptiveAlertDialog(context);
                  },
                  child: Text("Go to Event >>"),
                ),
                SizedBox(height: 14),
                ElevatedButton(
                  onPressed: () {
                    context.go(
                      "/product-detail/123?barang=laptop&stock=200",
                      // Navigation dengan data menggunakan extra sangat tidak disarankan untuk diwebsite
                      extra: "100 Unit Terjual",
                    );
                  },
                  child: Text("Go to Product Detail >>"),
                ),
                SizedBox(height: 14),
                // Responsive Layout dengan LayoutBuilder
                Container(
                  width: queryWidth,
                  height: bodyheight * 0.5,
                  color: Colors.blueGrey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyContainer(queryWidth: queryWidth),
                      MyContainer(queryWidth: queryWidth),
                      MyContainer(queryWidth: queryWidth),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                // Cara menggunakan DatePicker yang otomatis menyesuaikan dengan platform (tanpa package adaptivedialog)
                datepicker(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 