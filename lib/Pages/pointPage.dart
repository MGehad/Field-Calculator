import 'package:field_calculator/Pages/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:field_calculator/Pages/index.dart' as PC;

class PointConversionPage extends StatefulWidget {
  const PointConversionPage({super.key, required this.title});
  final String title;

  @override
  State<PointConversionPage> createState() => _PointConversionPageState();
}

class _PointConversionPageState extends State<PointConversionPage> {
  List<String> pointCartesianLabels = ["x", "y", "z"];
  List<String> pointCylindricalLabels = ["\u03C1", "\u00B0\u03D5", "z"];
  List<String> pointSphericalLabels = ["r", "\u00B0\u03B8", "\u00B0\u03D5"];

  late List<String> firstCurrentLabels;
  late List<String> secondCurrentLabels;

  int firstSelectedSeg = 1;
  int secondSelectedSeg = 2;
  TextEditingController pointControl1 = TextEditingController();
  TextEditingController pointControl2 = TextEditingController();
  TextEditingController pointControl3 = TextEditingController();

  TextEditingController resultControl = TextEditingController();

  List<double> A = [0, 0, 0];
  List<double> B = [0, 0, 0];

  @override
  void initState() {
    firstCurrentLabels = pointCartesianLabels;
    secondCurrentLabels = pointCylindricalLabels;
    super.initState();
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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          "${widget.title}",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Card(
                  color: Colors.grey.shade200,
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                        child: const Text(
                          'Enter Point Coordinates:',
                          style: TextStyle(fontFamily: 'Times', fontSize: 25),
                        ),
                      ),
                      const Divider(),
                      const SizedBox(height: 10),
                      SegmentedButton(
                          segments: const [
                            ButtonSegment(
                                value: 1,
                                icon: Icon(Icons.grid_4x4),
                                label: Text('Cartesian',style: TextStyle(fontSize: 12),)),
                            ButtonSegment(
                                value: 2,
                                icon: Icon(Icons.circle_outlined),
                                label: Text('Cylindrical',style: TextStyle(fontSize: 12),)),
                            ButtonSegment(
                                value: 3,
                                icon: Icon(Icons.circle_rounded),
                                label: Text('Spherical',style: TextStyle(fontSize: 12),))
                          ],
                          selected: {
                            firstSelectedSeg
                          },
                          onSelectionChanged: (index) {
                            setState(() {
                              firstSelectedSeg = index.first;
                              if (firstSelectedSeg == 1) {
                                firstCurrentLabels = pointCartesianLabels;
                              } else if (firstSelectedSeg == 2) {
                                firstCurrentLabels = pointCylindricalLabels;
                              } else {
                                firstCurrentLabels = pointSphericalLabels;
                              }
                            });
                          }),
                      Container(
                        height: 100,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            MyTextField(
                                label: firstCurrentLabels[0],
                                control: pointControl1,
                                canWrite: true),
                            const SizedBox(width: 20),
                            MyTextField(
                                label: firstCurrentLabels[1],
                                control: pointControl2,
                                canWrite: true),
                            const SizedBox(width: 20),
                            MyTextField(
                                label: firstCurrentLabels[2],
                                control: pointControl3,
                                canWrite: true),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Card(
                  color: Colors.grey.shade200,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                          child: const Text(
                            'Result Point Coordinates:',
                            style: TextStyle(fontFamily: 'Times', fontSize: 25),
                          ),
                        ),
                        Divider(),
                        SizedBox(height: 10),
                        SegmentedButton(
                            segments: const [
                              ButtonSegment(
                                  value: 1,
                                  icon: Icon(Icons.grid_4x4),
                                  label: Text('Cartesian',style: TextStyle(fontSize: 12),)),
                              ButtonSegment(
                                  value: 2,
                                  icon: Icon(Icons.circle_outlined),
                                  label: Text('Cylindrical',style: TextStyle(fontSize: 12),)),
                              ButtonSegment(
                                  value: 3,
                                  icon: Icon(Icons.circle_rounded),
                                  label: Text('Spherical',style: TextStyle(fontSize: 12),))
                            ],
                            selected: {
                              secondSelectedSeg
                            },
                            onSelectionChanged: (index) {
                              setState(() {
                                secondSelectedSeg = index.first;
                                if (secondSelectedSeg == 1) {
                                  secondCurrentLabels = pointCartesianLabels;
                                } else if (secondSelectedSeg == 2) {
                                  secondCurrentLabels = pointCylindricalLabels;
                                } else {
                                  secondCurrentLabels = pointSphericalLabels;
                                }
                              });
                            }),
                        Container(
                          alignment: Alignment.center,
                          height: 100,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Flex(direction: Axis.horizontal, children: [
                            MyTextField(
                                label: 'Result',
                                control: resultControl,
                                canWrite: false),
                          ]),
                        ),
                      ]),
                    )),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          initList();
          calculate();
        },
        label: const Text(
          'Calculate',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void initList() {
    A[0] = double.parse(pointControl1.text.isEmpty ? '0' : pointControl1.text);
    A[1] = double.parse(pointControl2.text.isEmpty ? '0' : pointControl2.text);
    A[2] = double.parse(pointControl3.text.isEmpty ? '0' : pointControl3.text);
  }

  void calculate() {
    if (firstSelectedSeg == 1 && secondSelectedSeg == 1) {
      B = A;
    } else if (firstSelectedSeg == 1 && secondSelectedSeg == 2) {
      B = PC.cartesienToCylindrical(A[0], A[1], A[2]);
    } else if (firstSelectedSeg == 1 && secondSelectedSeg == 3) {
      B = PC.cartesienToSpherical(A[0], A[1], A[2]);
    } else if (firstSelectedSeg == 2 && secondSelectedSeg == 1) {
      B = PC.cylindricalToCartesien(A[0], A[1], A[2]);
    } else if (firstSelectedSeg == 2 && secondSelectedSeg == 2) {
      B = A;
    } else if (firstSelectedSeg == 2 && secondSelectedSeg == 3) {
      B = PC.cylindricalToSpherical(A[0], A[1], A[2]);
    } else if (firstSelectedSeg == 3 && secondSelectedSeg == 1) {
      B = PC.sphericalToCartesien(A[0], A[1], A[2]);
    } else if (firstSelectedSeg == 3 && secondSelectedSeg == 2) {
      B = PC.sphericalToCylindrical(A[0], A[1], A[2]);
    } else if (firstSelectedSeg == 3 && secondSelectedSeg == 3) {
      B = A;
    }

    resultControl.text =
        "${B[0].toStringAsFixed(3)}${secondCurrentLabels[0]}, ${B[1].toStringAsFixed(3)}${secondCurrentLabels[1]}, ${B[2].toStringAsFixed(3)}${secondCurrentLabels[2]}";
  }
}
