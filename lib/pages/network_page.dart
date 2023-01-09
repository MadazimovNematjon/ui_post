import 'dart:convert';
import "package:http/http.dart";
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:ui_post/model/emp_model.dart';
import 'package:ui_post/service/network.dart';

class NetworkPage extends StatefulWidget {
  static String get id => 'network-page';
  const NetworkPage({Key? key}) : super(key: key);

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {

  var isLoading = false;
var items = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiPostLoad();
  }


  _apiPostLoad() async{
    setState(() {
      isLoading = true;
    });
    var response = await Network.GET(Network.API_GET,Network.paramsEmpty());
    // print(response);
    if(response != null){
        setState(() {
          isLoading = false;
          items = Network.parsePostList(response);
          print("===================>>>>>>>>>>>>> ${items}");
        });
    }else{
      return CircularProgressIndicator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
              return itemsHomePost(items[index]);
            },
          )
        ],
      ),
    );
  }

  Widget itemsHomePost(Employee post) {
    return Slidable(
      child: Container(
        padding: EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.employeeAge!.toString(),style: TextStyle(color: Colors.blue)),
            // Text(post!,style: TextStyle(color: Colors.black),),

          ],
        ),
      ),
    );
  }
}