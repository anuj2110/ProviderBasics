import 'package:flutter/material.dart';

class EligibilityScreenProvider extends ChangeNotifier{
  String _eligibilityMessage = "";
  bool _isEligible;

  void checkEligbility(int age){
    if (age>=18){
      eligibleForLicense();
    }
    else
    notELibileForLicense();
  }

  void eligibleForLicense() {
    _eligibilityMessage = "You are elibile for DL";
    _isEligible = true;

    notifyListeners();

  }

  void notELibileForLicense() {
    _eligibilityMessage = "You are not elibile for DL";
    _isEligible = false;

    notifyListeners();
  }

  String get eligibilityMessage => _eligibilityMessage;
  bool get isEligible => _isEligible;
}