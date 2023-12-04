import 'dart:math';

double scalerProduct(List<double> A, List<double> B) {
  double result = A[0] * B[0] + A[1] * B[1] + A[2] * B[2];
  return result;
}

List<double> crossProduct(List<double> A, List<double> B) {
 List<double> result = List<double>.filled(3, 0.0, growable: false);
  result[0] = A[1] * B[2] - A[2] * B[1];
  result[1] = -1 * ((A[0] * B[2]) - (A[2] * B[0]));
  result[2] = A[0] * B[1] - A[1] * B[0];
  return result;
}

double scalerTripleProduct(List<List<double>> matrixOfVector) {
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
  return determinant;
}

List<double> cartesienToCylindrical(double x, double y, double z) {
List<double> result = List<double>.filled(3, 0.0, growable: false);
  result[0] = sqrt(x * x + y * y);
  double angle = (180 / pi) * atan((y.abs()) / (x.abs()));

double phaiy;
if (x < 0 && y >= 0) {
  phaiy = 180 - angle;
} else if (x < 0 && y < 0) {
  phaiy = 180 + angle;
} else if (x >= 0 && y < 0) {
  phaiy = -1 * angle;
} else {
  phaiy = angle;
}

result[1] = phaiy;
  result[2] = z;
  return result;
}

List<double> cylindricalToCartesien(double raw, double phaiy, double z) {
  List<double> result = List<double>.filled(3, 0.0, growable: false);
  result[0] = raw * cos(phaiy * pi / 180);
  result[1] = raw * sin(phaiy * pi / 180);
  result[2] = z;
  return result;
}

List<double> cartesienToSpherical(double x, double y, double z) {
  List<double> result = List<double>.filled(3, 0.0, growable: false);
  result[0] = sqrt(x * x + y * y + z * z);
  result[1] = (180 / pi) * acos(z / result[0]);
  double angle = (180 / pi) * atan((y.abs()) / (x.abs()));

double phaiy;
if (x < 0 && y >= 0) {
  phaiy = 180 - angle;
} else if (x < 0 && y < 0) {
  phaiy = 180 + angle;
} else if (x >= 0 && y < 0) {
  phaiy = -1 * angle;
} else {
  phaiy = angle;
}

result[2] = phaiy;
 
  return result;
}

List<double> sphericalToCartesien(double r, double seta, double phaiy) {
 List<double> result = List<double>.filled(3, 0.0, growable: false);
  result[0] = r * sin(seta * pi / 180) * cos(phaiy * pi / 180);
  result[1] = r * sin(seta * pi / 180) * sin(phaiy * pi / 180);
  result[2] = r * cos(seta * pi / 180);
  return result;
}

List<double> sphericalToCylindrical(double r, double seta, double phaiy) {
  List<double> cartesian = sphericalToCartesien(r, seta, phaiy);
  List<double> cylindrical = cartesienToCylindrical(
      cartesian[0], cartesian[1], cartesian[2]);
  return cylindrical;
}

List<double> cylindricalToSpherical(double raw, double phaiy, double z) {
  List<double> cartesian = cylindricalToCartesien(raw, phaiy, z);
  List<double> spherical = cartesienToSpherical(
      cartesian[0], cartesian[1], cartesian[2]);
  return spherical;
}

// void main() {
//   List<double> A = List<double>.filled(3, 0.0, growable: false);
//   List<double> B = List<double>.filled(3, 0.0, growable: false);
 

  
//   A[0]=1;
//   A[1]=2;
//   A[2]=4;
//   B[0]=3;
//   B[1]=4;
//   B[2]=0;
//   List<double> R = List<double>.filled(3, 0.0, growable: false);
//   R=cartesienPointToSpherical(3,-4,5);
//   print(R);
  

  

// }