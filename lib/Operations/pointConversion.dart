import 'dart:math';


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
