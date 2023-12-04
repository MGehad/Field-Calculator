import 'package:field_calculator/Pages/about_us.dart';
import 'package:field_calculator/Pages/vector_multiplication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key,});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title:
        Center(
          child: Text(
              "Field Calculator",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              )
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0,left:10.0 ,right: 10.0),
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.of(context)
                    .push(
                    MaterialPageRoute(builder: (context) => VectorMultiplication() ,)
                );
              },
              child: Ink(
                child: Tooltip(
                  message: 'Go To Vector Multiplication',
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade300
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 20,top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calculate_outlined,size: 25),
                              SizedBox(width: 10,),
                              Text("Vector Multiplication",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(Icons.chevron_right,
                            size:22 ,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                
              },
              child: Ink(
                child: Tooltip(
                  message: 'Go To Coordinates Convertor',
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 20,top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.change_circle_outlined,size: 25),
                              SizedBox(width: 10,),
                              Text("Coordinates Convertor",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(Icons.chevron_right,
                            size:22 ,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              borderRadius: BorderRadius.circular(15),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AboutUs() ,)
                );
              },
              child: Ink(
                child: Tooltip(
                  message: 'About us',
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey.shade300
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0,right: 15,bottom: 20,top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info_outline,size: 25),
                              SizedBox(width: 10,),
                              Text("About us",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(Icons.chevron_right,
                            size:22 ,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}