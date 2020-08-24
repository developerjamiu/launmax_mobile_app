import 'package:flutter/material.dart';
import 'package:launmax_app/UI/screens/Payment_process.dart/checkout.dart';
import 'package:launmax_app/UI/screens/Payment_process.dart/payment.dart';
import 'package:launmax_app/models/orders.dart';

class StepperInfo extends ChangeNotifier {
  int _currentStep = 0;
  bool _complete = false;
  Order _order;

  List<Step> steps = [
    Step(
      title: const Text(''),
      isActive: true,
      state: StepState.indexed,
      content: Checkout(),
    ),
    Step(
      // subtitle: Text('data'),
      isActive: false,
      state: StepState.indexed,
      title: const Text(''),
      content: Payment(),
    ),
    Step(
      state: StepState.indexed,
      title: const Text(''),
      subtitle: const Text(""),
      content: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
          )
        ],
      ),
    ),
  ];

  setOrder(Order value){
    _order = value;
  notifyListeners();
  }

  Order getOrder(){
    return _order;
  }

  getCurrentStep() {
    return _currentStep;
  }

  setCurrentStep(int value) {
    _currentStep = value;
    notifyListeners();
  }

  getCompleteStep() {
    return _complete;
  }

  setCompleteStep() {
    _complete = !_complete;
    notifyListeners();
  }

  next() {
    getCurrentStep() + 1 != steps.length
        ? goTo(getCurrentStep() + 1)
        : setCompleteStep();
    notifyListeners();
  }

  cancel() {
    if (getCurrentStep() > 0) {
      goTo(getCurrentStep() - 1);
      notifyListeners();
    }
  }

  goTo(int step) {
    setCurrentStep(step);
    notifyListeners();
  }
}
