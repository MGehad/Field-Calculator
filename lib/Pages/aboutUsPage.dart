import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  AboutUs({
    super.key,
  });

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final Uri _url1 = Uri.parse('https://www.linkedin.com/in/mgehad/');
  final Uri _url2 =
      Uri.parse('https://www.linkedin.com/in/karim-elghamry-323372251/');
  final Uri _url3 =
      Uri.parse('https://www.linkedin.com/in/hassan-alzyat-307aa6282/');
  final Uri _url4 = Uri.parse('https://www.linkedin.com/in/mahmoudgala1');
  final Uri _url5 =
      Uri.parse('https://www.linkedin.com/in/shehap-ghazal-b95805271/');

  Future<void> _launchUrl(Uri uri) async {
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
        title: const Text("About Us",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              const SizedBox(height: 10.0),
              const Text(
                'Welcome to our Field Calculator!',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Prief:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'This is a project for the Electric Field course at Zagazig Engineering University.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const Text(
                'A vector calcuator that can do Cross, Dot, Triple Dot or Triple Cross operations. And also does vector and point conversions.',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Our Team:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: Stack(
                      children: [
                        const Image(image: AssetImage('Images/LinkedIn.png')),
                        InkWell(
                          onTap: () {
                            _launchUrl(_url1);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\tMohamed Gehad Hussein",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\t20812021100025 ",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\tمحمد جهاد حسين",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: Stack(
                      children: [
                        const Image(image: AssetImage('Images/LinkedIn.png')),
                        InkWell(
                          onTap: () {
                            _launchUrl(_url2);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\tKarim Salah EL-Din EL-Ghamry",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\t20812021101453 ",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\tكريم صلاح الدين الغمري",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: Stack(
                      children: [
                        const Image(image: AssetImage('Images/LinkedIn.png')),
                        InkWell(
                          onTap: () {
                            _launchUrl(_url3);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\tHassan Mohamed Hassan Ali",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\t20812021101068 ",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\tحسن محمد حسن علي",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: Stack(
                      children: [
                        const Image(image: AssetImage('Images/LinkedIn.png')),
                        InkWell(
                          onTap: () {
                            _launchUrl(_url4);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\tMahmoud Galal Ramadan EL-Gendy",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\t20812021101328 ",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\tمحمود جلال رمضان الجندي",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: Stack(
                      children: [
                        const Image(image: AssetImage('Images/LinkedIn.png')),
                        InkWell(
                          onTap: () {
                            _launchUrl(_url5);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "\tShehap Shokri Ghazal",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "\t20812021101328 ",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\tشهاب شكري غزال",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Contact Us:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Have any questions, feedback, or suggestions? Feel free to reach out to us at: \n- mogehad2030@gmail.com  \n- kimos20139@gmail.com\n- hassanalzyat.contact@gmail.com\n- mahmoudgalal173.95@gmail.com\n- sh.s.ghazal@gmail.com',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
