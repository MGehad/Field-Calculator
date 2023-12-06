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
