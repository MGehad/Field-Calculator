import 'package:field_calculator/Pages/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:field_calculator/Pages/vectorOperation.dart' as VC;
import "package:field_calculator/Pages/index.dart" as PC;

class VectorConversionPage extends StatefulWidget {
  const VectorConversionPage({super.key, required this.title});
  final String title;

  @override
  State<VectorConversionPage> createState() => _VectorConversionPageState();
}

class _VectorConversionPageState extends State<VectorConversionPage> {
  List<String> cartesianLabels = ["Ax", "Ay", "Az"];
  List<String> cylindricalLabels = ["A\u03C1", "A\u03D5", "Az"];
  List<String> sphericalLabels = ["Ar", "A\u03B8", "A\u03D5"];

  List<String> pointCartesianLabels = ["x", "y", "z"];
  List<String> pointCylindricalLabels = ["\u03C1", "\u03D5", "z"];
  List<String> pointSphericalLabels = ["r", "\u03B8", "\u03D5"];

  late List<String> firstCurrentLabels;
  late List<String> secondCurrentLabels;

  late List<String> pointCurrentLabels;
  int firstSelectedSeg = 1;
  int pointSelectedSeg = 1;
  int secondSelectedSeg = 2;

  TextEditingController vectorControl1 = TextEditingController();
  TextEditingController vectorControl2 = TextEditingController();
  TextEditingController vectorControl3 = TextEditingController();
  TextEditingController pointControl1 = TextEditingController();
  TextEditingController pointControl2 = TextEditingController();
  TextEditingController pointControl3 = TextEditingController();

  TextEditingController resultControl = TextEditingController();

  List<double> A = [0, 0, 0];
  List<double> Ap = [0, 0, 0];
  List<double> B = [0, 0, 0];

  @override
  void initState() {
    firstCurrentLabels = cartesianLabels;
    secondCurrentLabels = cylindricalLabels;
    pointCurrentLabels = pointCartesianLabels;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                          padding: const EdgeInsets.fromLTRB(25, 10, 30, 0),
                          child: const Text(
                            'Enter Vector Components:',
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
                                  label: Text('Cartesian')),
                              ButtonSegment(
                                  value: 2,
                                  icon: Icon(Icons.circle_outlined),
                                  label: Text('Cylindrical')),
                              ButtonSegment(
                                  value: 3,
                                  icon: Icon(Icons.circle_rounded),
                                  label: Text('Spherical'))
                            ],
                            selected: {
                              firstSelectedSeg
                            },
                            onSelectionChanged: (index) {
                              setState(() {
                                firstSelectedSeg = index.first;
                                if (firstSelectedSeg == 1) {
                                  firstCurrentLabels = cartesianLabels;
                                } else if (firstSelectedSeg == 2) {
                                  firstCurrentLabels = cylindricalLabels;
                                } else {
                                  firstCurrentLabels = sphericalLabels;
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
                                  control: vectorControl1,
                                  canWrite: true),
                              const SizedBox(width: 20),
                              MyTextField(
                                  label: firstCurrentLabels[1],
                                  control: vectorControl2,
                                  canWrite: true),
                              const SizedBox(width: 20),
                              MyTextField(
                                  label: firstCurrentLabels[2],
                                  control: vectorControl3,
                                  canWrite: true),
                            ],
                          ),
                        ),
                        const Divider(),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.fromLTRB(25, 0, 30, 10),
                          child: const Text(
                            'At Point:',
                            style: TextStyle(fontFamily: 'Times', fontSize: 25),
                          ),
                        ),
                        SegmentedButton(
                            segments: const [
                              ButtonSegment(
                                  value: 1,
                                  icon: Icon(Icons.grid_4x4),
                                  label: Text('Cartesian')),
                              ButtonSegment(
                                  value: 2,
                                  icon: Icon(Icons.circle_outlined),
                                  label: Text('Cylindrical')),
                              ButtonSegment(
                                  value: 3,
                                  icon: Icon(Icons.circle_rounded),
                                  label: Text('Spherical'))
                            ],
                            selected: {
                              pointSelectedSeg
                            },
                            onSelectionChanged: (index) {
                              setState(() {
                                pointSelectedSeg = index.first;
                                if (pointSelectedSeg == 1) {
                                  pointCurrentLabels = pointCartesianLabels;
                                } else if (pointSelectedSeg == 2) {
                                  pointCurrentLabels = pointCylindricalLabels;
                                } else {
                                  pointCurrentLabels = pointSphericalLabels;
                                }
                              });
                            }),
                        Container(
                          height: 100,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                          child: Row(
                            children: [
                              MyTextField(
                                  label: pointCurrentLabels[0],
                                  control: pointControl1,
                                  canWrite: true),
                              const SizedBox(width: 20),
                              MyTextField(
                                  label: pointCurrentLabels[1],
                                  control: pointControl2,
                                  canWrite: true),
                              const SizedBox(width: 20),
                              MyTextField(
                                  label: pointCurrentLabels[2],
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
                            padding: const EdgeInsets.fromLTRB(25, 10, 30, 0),
                            child: const Text(
                              'Result Vector Components:',
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
                                    label: Text('Cartesian')),
                                ButtonSegment(
                                    value: 2,
                                    icon: Icon(Icons.circle_outlined),
                                    label: Text('Cylindrical')),
                                ButtonSegment(
                                    value: 3,
                                    icon: Icon(Icons.circle_rounded),
                                    label: Text('Spherical'))
                              ],
                              selected: {
                                secondSelectedSeg
                              },
                              onSelectionChanged: (index) {
                                setState(() {
                                  secondSelectedSeg = index.first;
                                  if (secondSelectedSeg == 1) {
                                    secondCurrentLabels = cartesianLabels;
                                  } else if (secondSelectedSeg == 2) {
                                    secondCurrentLabels = cylindricalLabels;
                                  } else {
                                    secondCurrentLabels = sphericalLabels;
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
    A[0] =
        double.parse(vectorControl1.text.isEmpty ? '0' : vectorControl1.text);
    A[1] =
        double.parse(vectorControl2.text.isEmpty ? '0' : vectorControl2.text);
    A[2] =
        double.parse(vectorControl3.text.isEmpty ? '0' : vectorControl3.text);

    Ap[0] = double.parse(pointControl1.text.isEmpty ? '0' : pointControl1.text);
    Ap[1] = double.parse(pointControl2.text.isEmpty ? '0' : pointControl2.text);
    Ap[2] = double.parse(pointControl3.text.isEmpty ? '0' : pointControl3.text);
  }

  void calculate() {
    List<double> Apointfinal = [0, 0, 0];
    if (pointSelectedSeg == 1) {
      Apointfinal = Ap;
    } else if (pointSelectedSeg == 2) {
      Apointfinal = PC.cylindricalToCartesien(Ap[0], Ap[1], Ap[2]);
    } else if (pointSelectedSeg == 3) {
      Apointfinal = PC.sphericalToCartesien(Ap[0], Ap[1], Ap[2]);
    }

    if (firstSelectedSeg == 1 && secondSelectedSeg == 1) {
      B = A;
    } else if (firstSelectedSeg == 1 && secondSelectedSeg == 2) {
      B = VC.cartesianVectorToCylindrical(A[0], A[1], A[2], Apointfinal);
    } else if (firstSelectedSeg == 1 && secondSelectedSeg == 3) {
      B = VC.cartesianVectorToSpherical(A[0], A[1], A[2], Apointfinal);
    } else if (firstSelectedSeg == 2 && secondSelectedSeg == 1) {
      B = VC.cylindricalVectorToCartesian(A[0], A[1], A[2], Apointfinal);
    } else if (firstSelectedSeg == 2 && secondSelectedSeg == 2) {
      B = A;
    } else if (firstSelectedSeg == 2 && secondSelectedSeg == 3) {
      B = VC.cylindricalVectorToSpherical(A[0], A[1], A[2], Apointfinal);
    } else if (firstSelectedSeg == 3 && secondSelectedSeg == 1) {
      B = VC.sphericalVectorToCartesian(A[0], A[1], A[2], Apointfinal);
    } else if (firstSelectedSeg == 3 && secondSelectedSeg == 2) {
      B = VC.sphericalVectorToCylindrical(A[0], A[1], A[2], Apointfinal);
    } else if (firstSelectedSeg == 3 && secondSelectedSeg == 3) {
      B = A;
    }

    resultControl.text =
        "${B[0].toStringAsFixed(3)}${secondCurrentLabels[0]}, ${B[1].toStringAsFixed(3)}${secondCurrentLabels[1]}, ${B[2].toStringAsFixed(2)}${secondCurrentLabels[3]}";
  }
}
