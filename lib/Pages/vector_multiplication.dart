import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VectorMultiplication extends StatefulWidget {
  VectorMultiplication({super.key});

  @override
  State<VectorMultiplication> createState() => _VectorMultiplicationState();
}

class _VectorMultiplicationState extends State<VectorMultiplication> {
  int sliding = 0;
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
          "Vector Multiplication",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: CupertinoSegmentedControl<int>(
              children: {
                0: buildSegmentedText("A.B"),
                1: buildSegmentedText("AxB"),
                2: buildSegmentedText("A.BxC"),
                3: buildSegmentedText("Ax(BxC)"),
              },
              groupValue: sliding,
              onValueChanged: (value) {
                setState(() {
                  sliding = value;
                });
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Column(
                    children: [
                      buildVectorInput("A Vector:", Ax, Ay, Az),
                      SizedBox(height: 25),
                      buildVectorInput("B Vector:", Bx, By, Bz),
                      if (sliding > 1) SizedBox(height: 25),
                      if (sliding > 1) buildVectorInput("C Vector:", Cx, Cy, Cz),
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
                        child: TextField(
                          readOnly: true,
                          controller: Result,
                          decoration: InputDecoration(
                            labelText: "Result...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextButton(
                  onPressed: calculate,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Calculate",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSegmentedText(String text) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
      ),
    );
  }

  Widget buildVectorInput(String labelText, TextEditingController controller1, TextEditingController controller2, TextEditingController controller3) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            labelText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildTextField(controller1, "Ax"),
            buildTextField(controller2, "Ay"),
            buildTextField(controller3, "Az"),
          ],
        ),
      ],
    );
  }

  Widget buildTextField(TextEditingController controller, String labelText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.22,
      height: MediaQuery.of(context).size.height * 0.05,
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
      ),
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
          scalerProduct(vectorA, vectorB);
          break;
        case 1:
          crossProduct(vectorA, vectorB);
          break;
        case 2:
          scalerTripleProduct([vectorA, vectorB, vectorC]);
          break;
        case 3:
          crossProduct(
            vectorA,
            crossProduct(vectorB, vectorC),
          );
          break;
      }
    });
  }

  void scalerProduct(List<double> A, List<double> B) {
    double result = A[0] * B[0] + A[1] * B[1] + A[2] * B[2];
    Result.text = result.toString();
  }

  List<double> crossProduct(List<double> A, List<double> B) {
    List<double> result = [
      A[1] * B[2] - A[2] * B[1],
      -(A[0] * B[2] - A[2] * B[0]),
      A[0] * B[1] - A[1] * B[0]
    ];
    String Ry = (result[1] > 0) ? "+${result[1]} Ry" : "${result[1]} Ry";
    String Rz = (result[2] > 0) ? "+${result[2]} Rz" : "${result[2]} Rz";
    Result.text = "${result[0]} Rx${Ry}${Rz}";
    return result;
  }

  scalerTripleProduct(List<List<double>> matrixOfVector) {
    double determinant = 0;
    determinant += matrixOfVector[0][0] *
        (matrixOfVector[1][1] * matrixOfVector[2][2] -
            matrixOfVector[1][2] * matrixOfVector[2][1]);
    determinant -= matrixOfVector[0][1] *
        (matrixOfVector[1][0] * matrixOfVector[2][2] -
            matrixOfVector[1][2] * matrixOfVector[2][0]);
    determinant += matrixOfVector[0][2] *
        (matrixOfVector[1][0] * matrixOfVector[2][1] -
            matrixOfVector[1][1] * matrixOfVector[2][0]);
    Result.text = determinant.toString();
  }
}
