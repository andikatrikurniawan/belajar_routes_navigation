import 'package:flutter/material.dart';
import 'router/app_router.dart';
import 'package:url_strategy/url_strategy.dart';


void main(){
  //untuk menghilangkan Hashtag pada URL
 setPathUrlStrategy();
  runApp(MyRoutes());
}

class MyRoutes extends StatefulWidget {
  const MyRoutes({super.key});

  @override
  State<MyRoutes> createState() => _MyRoutesState();
}

class _MyRoutesState extends State<MyRoutes> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      title: "Go Router 101",
    );
  }
}