import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutUs extends StatefulWidget {
  AboutUs({super.key,});

  @override
  State<AboutUs> createState() => _AboutUsState();

}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios,color: Colors.white),
          ),
          title:
          Text(
              "About Us",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              )
          ),
        ),
        body:Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to Field Calculator!',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Our Mission:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'At Field Calculator, we strive to provide powerful and intuitive tools for mathematical computations and vector operations.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Our Team:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\t\t\t 1.Mohamed Gehad Hussein"
                          "\n\t\t\t 2.Kareem Salah"
                          "\n\t\t\t 3.Hassan Mohamed Hassan"
                          "\n\t\t\t 4.Mahmoud Galal Ramadan EL-Gendy"
                          "\n\t\t\t 5.Shehab Shokri",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Contact Us:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Have any questions, feedback, or suggestions? Feel free to reach out to us at mogehad2030@gmail.com.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
