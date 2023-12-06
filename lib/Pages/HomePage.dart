import 'package:field_calculator/Pages/HistoryPage.dart';
import 'package:field_calculator/Pages/aboutUsPage.dart';
import 'package:field_calculator/Pages/pointConvertPage.dart';
import 'package:field_calculator/Pages/vectorConvertPage.dart';
import 'package:field_calculator/Pages/vectorMultiplicationPage.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
        title: const Center(
          child: Text("Field Calculator",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Card(
              elevation: 3,
              child: InkWell(
                enableFeedback: true,
                borderRadius: BorderRadius.circular(12),
                splashColor: Theme.of(context).colorScheme.inversePrimary,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => VectorMultiplication(),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Ink(
                    child: const Tooltip(
                      message: 'Go To Vector Multiplication',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calculate_outlined, size: 25),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Vector Multiplication",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Card(
              elevation: 3,
              child: InkWell(
                enableFeedback: true,
                borderRadius: BorderRadius.circular(12),
                splashColor: Theme.of(context).colorScheme.inversePrimary,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const VectorConversionPage(
                          title: 'Vector Converter')));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Ink(
                    child: const Tooltip(
                      message: 'Go To Vector Converter',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.change_circle_outlined, size: 25),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Vector Converter",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Card(
              elevation: 3,
              child: InkWell(
                enableFeedback: true,
                borderRadius: BorderRadius.circular(12),
                splashColor: Theme.of(context).colorScheme.inversePrimary,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const PointConversionPage(title: 'Point Converter'),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Ink(
                    child: const Tooltip(
                      message: 'Go To Point Converter',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.change_circle_outlined, size: 25),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Point Converter",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Card(
              elevation: 3,
              child: InkWell(
                enableFeedback: true,
                borderRadius: BorderRadius.circular(12),
                splashColor: Theme.of(context).colorScheme.inversePrimary,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HistoryPage(),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Ink(
                    child: const Tooltip(
                      message: 'Histoy',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.history, size: 25),
                              SizedBox(
                                width: 10,
                              ),
                              Text("History",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Card(
              elevation: 3,
              child: InkWell(
                enableFeedback: true,
                borderRadius: BorderRadius.circular(12),
                splashColor: Theme.of(context).colorScheme.inversePrimary,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AboutUs(),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Ink(
                    child: const Tooltip(
                      message: 'About us',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.info_outline, size: 25),
                              SizedBox(
                                width: 10,
                              ),
                              Text("About us",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 22,
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
