import 'package:flutter/material.dart';
import 'package:field_calculator/main.dart';
import 'package:field_calculator/Operations/pointConversion.dart' as PC;
import 'package:field_calculator/Pages/myTextField.dart';
import 'package:field_calculator/Pages/HistoryPage.dart';

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

  List<String> segmentedButtonLabels = [
    "Cartesian",
    "Cylindrical",
    "Spherical",
  ];

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
    return GestureDetector(
      onTap: () {
        primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
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
                        'Enter Point Coordinates:',
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
                              firstCurrentLabels = pointCartesianLabels;
                            } else if (firstSelectedSeg == 2) {
                              firstCurrentLabels = pointCylindricalLabels;
                            } else {
                              firstCurrentLabels = pointSphericalLabels;
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
                          'Result Point Coordinates:',
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

    historyDataList.insert(
        0,
        HistoryCardData(
            operation: 'Point Conversion',
            input1:
                "${A[0].toStringAsFixed(3)}${firstCurrentLabels[0]}, ${A[1].toStringAsFixed(3)}${firstCurrentLabels[1]}, ${A[2].toStringAsFixed(3)}${firstCurrentLabels[2]}",
            input2: '',
            input3: '',
            inputType1: segmentedButtonLabels[firstSelectedSeg - 1],
            inputType2: '',
            inputType3: '',
            result: resultControl.text,
            resultType: segmentedButtonLabels[secondSelectedSeg - 1]));
  }
}
