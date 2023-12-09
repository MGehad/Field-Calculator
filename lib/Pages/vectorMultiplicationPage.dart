import 'package:field_calculator/Pages/HistoryPage.dart';
import 'package:field_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:field_calculator/pages/myTextField.dart';
import 'package:field_calculator/Operations/vectorOperations.dart' as VO;

class VectorMultiplication extends StatefulWidget {
  const VectorMultiplication({super.key});

  @override
  State<VectorMultiplication> createState() => _VectorMultiplicationState();
}

class _VectorMultiplicationState extends State<VectorMultiplication> {
  int sliding = 0;

  List<String> segmentedButtonLabels = [
    'A\u22C5B',
    'A\u2A2FB',
    'A\u22C5B\u2A2FC',
    'A\u2A2F(B\u2A2FC)'
  ];

  TextEditingController Ax = TextEditingController();
  TextEditingController Ay = TextEditingController();
  TextEditingController Az = TextEditingController();
  TextEditingController Bx = TextEditingController();
  TextEditingController By = TextEditingController();
  TextEditingController Bz = TextEditingController();
  TextEditingController Cx = TextEditingController();
  TextEditingController Cy = TextEditingController();
  TextEditingController Cz = TextEditingController();
  TextEditingController Result = TextEditingController();

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
            elevation: 0,
            title: const Text(
              "Vector Multiplication",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 3,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Select Operation:',
                          style: TextStyle(
                              fontFamily: 'Times',
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SegmentedButton(
                          showSelectedIcon: false,
                          style: const ButtonStyle(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            visualDensity:
                                VisualDensity(horizontal: -1, vertical: -1),
                          ),
                          segments: [
                            ButtonSegment(
                                value: 0,
                                label: Text(segmentedButtonLabels[0],
                                    style: const TextStyle(
                                        fontFamily: 'Times', fontSize: 18))),
                            ButtonSegment(
                                value: 1,
                                label: Text(segmentedButtonLabels[1],
                                    style: const TextStyle(
                                        fontFamily: 'Times', fontSize: 18))),
                            ButtonSegment(
                                value: 2,
                                label: Text(segmentedButtonLabels[2],
                                    style: const TextStyle(
                                        fontFamily: 'Times', fontSize: 18))),
                            ButtonSegment(
                                value: 3,
                                label: Text(segmentedButtonLabels[3],
                                    style: const TextStyle(
                                        fontFamily: 'Times', fontSize: 17)))
                          ],
                          selected: {sliding},
                          onSelectionChanged: (index) {
                            setState(() {
                              sliding = index.first;
                            });
                          }),
                      const Divider(height: 30),
                      buildVectorInput("Vector A:", Ax, Ay, Az),
                      const SizedBox(height: 30),
                      buildVectorInput("Vector B:", Bx, By, Bz),
                      if (sliding > 1) const SizedBox(height: 30),
                      if (sliding > 1)
                        buildVectorInput("Vector C:", Cx, Cy, Cz),
                      const Divider(height: 30),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Flex(direction: Axis.horizontal, children: [
                          MyTextField(
                            canWrite: false,
                            control: Result,
                            label: 'Result',
                          ),
                        ]),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: calculate,
            label: const Text(
              'Calculate',
              style: TextStyle(fontFamily: 'Times', fontSize: 20),
            ),
          ),
        ));
  }

  Widget buildVectorInput(String labelText, TextEditingController controller1,
      TextEditingController controller2, TextEditingController controller3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 15, 15),
          child: Text(
            labelText,
            style: const TextStyle(
                fontFamily: 'Times', fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Flex(
          direction: Axis.horizontal,
          children: [
            const SizedBox(width: 10),
            MyTextField(
              canWrite: true,
              label: 'Ax',
              control: controller1,
            ),
            const SizedBox(width: 20),
            MyTextField(
              canWrite: true,
              label: 'Ay',
              control: controller2,
            ),
            const SizedBox(width: 20),
            MyTextField(
              canWrite: true,
              label: 'Az',
              control: controller3,
            ),
            const SizedBox(width: 10),
          ],
        ),
      ],
    );
  }

  Widget buildTextField(TextEditingController controller, String labelText) {
    return MyTextField(
      canWrite: true,
      label: labelText,
      control: controller,
    );
  }

  void calculate() {
    List<double> vectorA = [
      double.tryParse(Ax.text) ?? 0,
      double.tryParse(Ay.text) ?? 0,
      double.tryParse(Az.text) ?? 0
    ];
    List<double> vectorB = [
      double.tryParse(Bx.text) ?? 0,
      double.tryParse(By.text) ?? 0,
      double.tryParse(Bz.text) ?? 0
    ];
    List<double> vectorC = [
      double.tryParse(Cx.text) ?? 0,
      double.tryParse(Cy.text) ?? 0,
      double.tryParse(Cz.text) ?? 0
    ];

    setState(() {
      switch (sliding) {
        case 0:
          Result.text = VO.scalerProduct(vectorA, vectorB).toString();
          break;
        case 1:
          List<double> res = VO.crossProduct(vectorA, vectorB);
          String Ry = (res[1] > 0) ? "+${res[1]}Ry" : "${res[1]}Ry";
          String Rz = (res[2] > 0) ? "+${res[2]}Rz" : "${res[2]}Rz";
          Result.text = "${res[0]}Rx ${Ry} ${Rz}";
          break;
        case 2:
          Result.text =
              VO.scalerTripleProduct([vectorA, vectorB, vectorC]).toString();
          break;
        case 3:
          List<double> res = VO.crossProduct(
            vectorA,
            VO.crossProduct(vectorB, vectorC),
          );
          String Ry = (res[1] > 0) ? "+${res[1]}Ry" : "${res[1]}Ry";
          String Rz = (res[2] > 0) ? "+${res[2]}Rz" : "${res[2]}Rz";
          Result.text = "${res[0]}Rx ${Ry} ${Rz}";
          break;
      }

      historyDataList.insert(
          0,
          HistoryCardData(
            operation: segmentedButtonLabels[sliding],
            input1:
                "${vectorA[0].toStringAsFixed(1)}Rx, ${vectorA[1].toStringAsFixed(1)}Ry, ${vectorA[2].toStringAsFixed(1)}Rz",
            input2:
                "${vectorB[0].toStringAsFixed(1)}Rx, ${vectorB[1].toStringAsFixed(1)}Ry, ${vectorB[2].toStringAsFixed(1)}Rz",
            input3: (sliding == 2 || sliding == 3)
                ? "${vectorC[0].toStringAsFixed(1)}Rx, ${vectorC[1].toStringAsFixed(1)}Ry, ${vectorC[2].toStringAsFixed(1)}Rz"
                : '',
            inputType1: '',
            inputType2: '',
            inputType3: '',
            result: Result.text,
            resultType: '',
          ));
    });
  }
}
