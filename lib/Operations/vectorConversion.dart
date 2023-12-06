import 'dart:math';

List<double> cartesianVectorToCylindrical(
    double Ax, double Ay, double Az, List<double> point) {
  double angle = ((180 / pi) * atan((point[1]).abs() / (point[0]).abs()));
  double phaiy;

  if (point[0] < 0 && point[1] >= 0) {
    phaiy = 180 - angle;
  } else if (point[0] < 0 && point[1] < 0) {
    phaiy = 180 + angle;
  } else if (point[0] >= 0 && point[1] < 0) {
    phaiy = -1 * angle;
  } else {
    phaiy = angle;
  }

  List<double> cylindricalVector = List.filled(3, 0);
  cylindricalVector[0] =
      Ax * cos(pi / 180 * phaiy) + Ay * sin(pi / 180 * phaiy);
  cylindricalVector[1] =
      -1 * Ax * sin((pi / 180) * phaiy) + Ay * cos((pi / 180) * phaiy);
  cylindricalVector[2] = Az;
  return cylindricalVector;
}

List<double> cylindricalVectorToCartesian(
    double A_raw, double A_phai, double Az, List<double> point) {
  double angle = ((180 / pi) * atan((point[1]).abs() / (point[0]).abs()));
  double phaiy;

  if (point[0] < 0 && point[1] >= 0) {
    phaiy = 180 - angle;
  } else if (point[0] < 0 && point[1] < 0) {
    phaiy = 180 + angle;
  } else if (point[0] >= 0 && point[1] < 0) {
    phaiy = -1 * angle;
  } else {
    phaiy = angle;
  }

  List<double> cartesianVector = List.filled(3, 0);
  cartesianVector[0] =
      A_raw * cos(pi / 180 * phaiy) - A_phai * sin(pi / 180 * phaiy);
  cartesianVector[1] =
      A_raw * sin((pi / 180) * phaiy) + A_phai * cos((pi / 180) * phaiy);
  cartesianVector[2] = Az;
  return cartesianVector;
}

List<double> cartesianVectorToSpherical(
    double Ax, double Ay, double Az, List<double> point) {
  double angle = ((180 / pi) * atan((point[1]).abs() / (point[0]).abs()));
  double phaiy;

  if (point[0] < 0 && point[1] >= 0) {
    phaiy = 180 - angle;
  } else if (point[0] < 0 && point[1] < 0) {
    phaiy = 180 + angle;
  } else if (point[0] >= 0 && point[1] < 0) {
    phaiy = -1 * angle;
  } else {
    phaiy = angle;
  }

  double r =
      sqrt(point[0] * point[0] + point[1] * point[1] + point[2] * point[2]);
  double seta = (180 / pi) * acos(point[2] / r);

  List<double> sphericalVector = List.filled(3, 0);
  sphericalVector[0] = Ax * sin(pi / 180 * seta) * cos(pi / 180 * phaiy) +
      Ay * sin(pi / 180 * seta) * sin(pi / 180 * phaiy) +
      Az * cos(pi / 180 * seta);
  sphericalVector[1] = Ax * cos(pi / 180 * seta) * cos(pi / 180 * phaiy) +
      Ay * cos(pi / 180 * seta) * sin(pi / 180 * phaiy) -
      Az * sin(pi / 180 * seta);
  sphericalVector[2] =
      -1 * Ax * sin(pi / 180 * phaiy) + Ay * cos(pi / 180 * phaiy);
  return sphericalVector;
}

List<double> sphericalVectorToCartesian(
    double Ar, double A_seta, double A_phai, List<double> point) {
  double angle = ((180 / pi) * atan((point[1]).abs() / (point[0]).abs()));
  double phaiy;

  if (point[0] < 0 && point[1] >= 0) {
    phaiy = 180 - angle;
  } else if (point[0] < 0 && point[1] < 0) {
    phaiy = 180 + angle;
  } else if (point[0] >= 0 && point[1] < 0) {
    phaiy = -1 * angle;
  } else {
    phaiy = angle;
  }

  double r =
      sqrt(point[0] * point[0] + point[1] * point[1] + point[2] * point[2]);
  double seta = (180 / pi) * acos(point[2] / r);

  List<double> cartesianVector = List.filled(3, 0);
  cartesianVector[0] = Ar * sin(pi / 180 * seta) * cos(pi / 180 * phaiy) +
      A_seta * cos(pi / 180 * seta) * cos(pi / 180 * phaiy) -
      A_phai * sin(pi / 180 * phaiy);
  cartesianVector[1] = Ar * sin(pi / 180 * seta) * sin(pi / 180 * phaiy) +
      A_seta * cos(pi / 180 * seta) * sin(pi / 180 * phaiy) +
      A_phai * cos(pi / 180 * phaiy);
  cartesianVector[2] =
      Ar * cos(pi / 180 * seta) - A_seta * sin(pi / 180 * seta);
  return cartesianVector;
}

List<double> sphericalVectorToCylindrical(
    double Ar, double A_seta, double A_phai, List<double> point) {
  List<double> cartesianVector =
      sphericalVectorToCartesian(Ar, A_seta, A_phai, point);
  List<double> cylindricalVector = cartesianVectorToCylindrical(
      cartesianVector[0], cartesianVector[1], cartesianVector[2], point);
  return cylindricalVector;
}

List<double> cylindricalVectorToSpherical(
    double A_raw, double A_phai, double Az, List<double> point) {
  List<double> cartesianVector =
      cylindricalVectorToCartesian(A_raw, A_phai, Az, point);
  List<double> sphericalVector = cartesianVectorToSpherical(
      cartesianVector[0], cartesianVector[1], cartesianVector[2], point);
  return sphericalVector;
}
