import 'package:flutter/material.dart';

import 'package:itk_project3/model/concept.dart';

class ConceptProvider extends ChangeNotifier {
  List<Concept> concepts = [];
  //int dummyNumber = 0;

  void addConcept(title, amount, desc, isIncome, createdAt) {
    Concept concept = Concept(
        title: title,
        amount: amount,
        description: desc,
        isIncome: isIncome,
        createdAt: createdAt);
    concepts.add(concept);
    notifyListeners();
  }

  get getConceptCount => concepts.length;

  num getBalance() {
    num total = 0;
    for (var element in concepts) {
      if (element.isIncome) {
        total = total + element.amount;
      } else {
        total = total - element.amount;
      }
    }
    return total;
  }
}
