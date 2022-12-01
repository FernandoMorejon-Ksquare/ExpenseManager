import 'package:flutter/material.dart';

class ConceptView extends StatelessWidget {
  String title;
  String createdAt;
  bool isIncome;
  num amount;

  ConceptView({
    super.key,
    required this.title,
    required this.createdAt,
    required this.isIncome,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    String incOrExp;
    MaterialColor colorConcept;
    if (isIncome) {
      incOrExp = "+$amount";
      colorConcept = Colors.green;
    } else {
      incOrExp = "-$amount";
      colorConcept = Colors.red;
    }
    return Container(
      height: 100,
      color: const Color(0xfff4f4f4),
      margin: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 200,
            margin: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  createdAt,
                  style: const TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: Text(
              incOrExp,
              style: TextStyle(fontSize: 18, color: colorConcept),
            ),
          )
        ],
      ),
    );
  }
}
