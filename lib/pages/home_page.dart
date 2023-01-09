import 'package:flutter/material.dart';
import 'package:ui_post/pages/network_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.pushReplacementNamed(context, NetworkPage.id);
          },
          child: Container(
            height: 50,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 40,right: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.blue,
            ),
            child: const Center(child: Text("Network",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),)),
          ),
        ),
      ),
    );
  }
}
