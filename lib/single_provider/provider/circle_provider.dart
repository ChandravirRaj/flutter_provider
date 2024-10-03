import 'package:flutter/foundation.dart';

class CircleProvider with ChangeNotifier, DiagnosticableTreeMixin {
  double _height = 20;
  double _width = 20;

  double get height => _height;

  double get width => _width;

  void setHeightAndWidth(double value) {
    _height = value;
    _width = value;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('_height', _height));
    properties.add(DoubleProperty('_width', _width));
  }
}
