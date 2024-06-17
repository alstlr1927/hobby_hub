import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier {
  bool _showLoadingLayout = false;
  bool get showLoadingLayout => _showLoadingLayout;

  void setLoadingFlag(bool flag) {
    _showLoadingLayout = flag;
    notifyListeners();
  }
}
