import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  AboutUs({super.key,});

  @override
  State<AboutUs> createState() => _AboutUsState();

}

class _AboutUsState extends State<AboutUs> {
  final Uri _url1 = Uri.parse('https://www.linkedin.com/in/mgehad/');
  final Uri _url2 = Uri.parse('https://www.linkedin.com/in/mgehad/');
  final Uri _url3 = Uri.parse('https://www.linkedin.com/in/mgehad/');
  final Uri _url4 = Uri.parse('https://www.linkedin.com/in/mahmoudgala1');
  final Uri _url5 = Uri.parse('https://www.linkedin.com/in/mgehad/');

  Future<void> _launchUrl(Uri uri) async {
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw Exception('Could not launch $uri');
    }
  }

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
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              _launchUrl(_url1);
                            },
                            child: Icon(Icons.person,size: 16)
                        ),
                        Text("\tMohamed Gehad Hussein",style: TextStyle(
                          fontSize: 16.0,
                        ),)
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              _launchUrl(_url2);
                            },
                            child: Icon(Icons.person,size: 16)
                        ),                        Text("\tKareem Salah EL-Din EL-Ghamry",style: TextStyle(
                          fontSize: 16.0,
                        ),)
                      ],
                    ),Row(
                      children: [
                        InkWell(
                            onTap: () {
                              _launchUrl(_url3);
                            },
                            child: Icon(Icons.person,size: 16)
                        ),
                        Text("\tHassan Mohamed Hassan Ali",style: TextStyle(
                          fontSize: 16.0,
                        ),)
                      ],
                    ),Row(
                      children: [
                        InkWell(
                            onTap: () {
                              _launchUrl(_url4);
                            },
                            child: Icon(Icons.person,size: 16)
                        ),
                        Text("\tMahmoud Galal Ramadan EL-Gendy",style: TextStyle(
                          fontSize: 16.0,
                        ),)
                      ],
                    ),Row(
                      children: [
                        InkWell(
                            onTap: () {
                              _launchUrl(_url5);
                            },
                            child: Icon(Icons.person,size: 16)
                        ),
                        Text("\tShehap Shokri Ghazal",style: TextStyle(
                          fontSize: 16.0,
                        ),)
                      ],
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
