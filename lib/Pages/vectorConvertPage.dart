import 'package:field_calculator/Pages/HistoryPage.dart';
import 'package:field_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:field_calculator/Operations/vectorConversion.dart' as VC;
import 'package:field_calculator/Operations/pointConversion.dart' as PC;
import 'package:field_calculator/pages/myTextField.dart';

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

  List<String> smallCartesianLabels = ["ax", "ay", "az"];
  List<String> smallCylindricalLabels = ["a\u03C1", "a\u03D5", "az"];
  List<String> smallSphericalLabels = ["ar", "a\u03B8", "a\u03D5"];

  List<String> pointCartesianLabels = ["x", "y", "z"];
  List<String> pointCylindricalLabels = ["\u03C1", "\u03D5", "z"];
  List<String> pointSphericalLabels = ["r", "\u03B8", "\u03D5"];

  List<String> segmentedButtonLabels = [
    "Cartesian",
    "Cylindrical",
    "Spherical",
  ];
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
    secondCurrentLabels = smallCylindricalLabels;
    pointCurrentLabels = pointCartesianLabels;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text(widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        body: Container(
          alignment: Alignment.topCenter,
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Card(
                  elevation: 3,
                  child: Column(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: const Text(
                        'Enter Vector Components:',
                        style: TextStyle(fontFamily: 'Times', fontSize: 24),
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    SegmentedButton(
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity:
                              VisualDensity(horizontal: -1, vertical: -1),
                        ),
                        segments: [
                          ButtonSegment(
                              value: 1,
                              icon: const Icon(Icons.grid_4x4),
                              label: Text(segmentedButtonLabels[0])),
                          ButtonSegment(
                              value: 2,
                              icon: const Icon(Icons.circle_outlined),
                              label: Text(segmentedButtonLabels[1])),
                          ButtonSegment(
                              value: 3,
                              icon: const Icon(Icons.circle_rounded),
                              label: Text(segmentedButtonLabels[2]))
                        ],
                        selected: {firstSelectedSeg},
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
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
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
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: const Text(
                        'At Point:',
                        style: TextStyle(fontFamily: 'Times', fontSize: 22),
                      ),
                    ),
                    SegmentedButton(
                        style: const ButtonStyle(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity:
                              VisualDensity(horizontal: -1, vertical: -1),
                        ),
                        segments: [
                          ButtonSegment(
                              value: 1,
                              icon: const Icon(Icons.grid_4x4),
                              label: Text(segmentedButtonLabels[0])),
                          ButtonSegment(
                              value: 2,
                              icon: const Icon(Icons.circle_outlined),
                              label: Text(segmentedButtonLabels[1])),
                          ButtonSegment(
                              value: 3,
                              icon: const Icon(Icons.circle_rounded),
                              label: Text(segmentedButtonLabels[2]))
                        ],
                        selected: {pointSelectedSeg},
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
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                      child: Flex(
                        direction: Axis.horizontal,
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
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 100,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Card(
                    elevation: 3,
                    child: Column(children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: const Text(
                          'Result Vector Components:',
                          style: TextStyle(fontFamily: 'Times', fontSize: 24),
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      SegmentedButton(
                          style: const ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity:
                                VisualDensity(horizontal: -1, vertical: -1),
                          ),
                          segments: [
                            ButtonSegment(
                                value: 1,
                                icon: const Icon(Icons.grid_4x4),
                                label: Text(segmentedButtonLabels[0])),
                            ButtonSegment(
                                value: 2,
                                icon: const Icon(Icons.circle_outlined),
                                label: Text(segmentedButtonLabels[1])),
                            ButtonSegment(
                                value: 3,
                                icon: const Icon(Icons.circle_rounded),
                                label: Text(segmentedButtonLabels[2]))
                          ],
                          selected: {secondSelectedSeg},
                          onSelectionChanged: (index) {
                            setState(() {
                              secondSelectedSeg = index.first;
                              if (secondSelectedSeg == 1) {
                                secondCurrentLabels = smallCartesianLabels;
                              } else if (secondSelectedSeg == 2) {
                                secondCurrentLabels = smallCylindricalLabels;
                              } else {
                                secondCurrentLabels = smallSphericalLabels;
                              }
                            });
                          }),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                        child: Flex(direction: Axis.horizontal, children: [
                          MyTextField(
                              label: 'Result',
                              control: resultControl,
                              canWrite: false),
                        ]),
                      ),
                    ])),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            initList();
            calculate();
          },
          label: const Text(
            'Calculate',
            style: TextStyle(fontFamily: 'Times', fontSize: 20),
          ),
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
        "${B[0].toStringAsFixed(3)}${secondCurrentLabels[0]}, ${B[1].toStringAsFixed(3)}${secondCurrentLabels[1]}, ${B[2].toStringAsFixed(3)}${secondCurrentLabels[2]}";

    historyDataList.insert(
        0,
        HistoryCardData(
            operation: 'Vector Conversion',
            input1:
                "${A[0].toStringAsFixed(3)}${firstCurrentLabels[0]}, ${A[1].toStringAsFixed(3)}${firstCurrentLabels[1]}, ${A[2].toStringAsFixed(3)}${firstCurrentLabels[2]}",
            input2:
                "${A[0].toStringAsFixed(2)}${pointCurrentLabels[0]}, ${A[1].toStringAsFixed(2)}${pointCurrentLabels[1]}, ${A[2].toStringAsFixed(2)}${pointCurrentLabels[2]}",
            input3: '',
            inputType1: segmentedButtonLabels[firstSelectedSeg - 1],
            inputType2: "Point ${segmentedButtonLabels[pointSelectedSeg - 1]}",
            inputType3: '',
            result: resultControl.text,
            resultType: segmentedButtonLabels[secondSelectedSeg - 1]));
  }
}
