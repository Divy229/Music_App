import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("H E L P & S U P P O R T"),
        backgroundColor: Colors.tealAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.all(25),
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 60,
                    width: 270,
                    color: Colors.tealAccent,
                    child: Text("Customer Support : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)),
              ],
            ),
            Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
                    height: 40,
                      width: 1000,
                      child: Text("Email : divy2209@gmail.com", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),)),),

                Center(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 30),
                      height: 40,
                        width: 1000,
                        child: Text("contact us : +91 9512313082", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),))),


                 Center(
                      child: Container(
                        height: 40,
                        width: 1000,
                        child: Text("Toll-free Number :  1800 558 9840",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal,),),
                      ))
              ],
            ),

          ],
        ),
      ),

    );
  }
}