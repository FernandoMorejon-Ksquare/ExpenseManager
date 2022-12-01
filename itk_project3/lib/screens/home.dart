import 'package:flutter/material.dart';
import 'package:itk_project3/custom_widgets/balance.dart';
import 'package:itk_project3/custom_widgets/concept_view.dart';
import 'package:itk_project3/model/concept.dart';
import 'package:itk_project3/provider/provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Home({super.key});
  int dataFound = 0;

  final List<Widget> _mainWidget = <Widget>[
    const Expanded(
        child: Center(
      child: Text(
        "No Data Found",
        style: TextStyle(fontSize: 20),
      ),
    )),
    Flexible(child: Consumer<ConceptProvider>(
      builder: (((context, obj, child) {
        List<Concept> concepts = obj.concepts;
        return ListView.builder(
          itemCount: concepts.length,
          itemBuilder: (((context, index) {
            Concept concept = concepts[index];
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: ConceptView(
                  title: concept.title,
                  createdAt: concept.createdAt,
                  isIncome: concept.isIncome,
                  amount: concept.amount),
            );
          })),
        );
      })),
    ))
  ];

  @override
  Widget build(BuildContext context) {
    int numberConcepts = Provider.of<ConceptProvider>(context).getConceptCount;
    if (numberConcepts > 0) {
      dataFound = 1;
    } else {
      dataFound = 0;
    }
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Balance(),
          _mainWidget.elementAt(dataFound),
        ],
      )),
    );
  }
}
