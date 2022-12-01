import 'package:flutter/material.dart';
import 'package:itk_project3/constants/app_string.dart';
import 'package:itk_project3/provider/provider.dart';
import 'package:itk_project3/screens/adder.dart';
import 'package:provider/provider.dart';

class Balance extends StatelessWidget {
  const Balance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: double.infinity,
        color: const Color(0xff5ebd93),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              AppString.balance,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "\$ ${Provider.of<ConceptProvider>(context).getBalance().toString()} ${AppString.currency}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                  key: const Key('createButton'),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                  onPressed: () {
                    //Here goes the jump to the add concept
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddConceptScreen(),
                      ),
                    );
                  },
                  child: Text(
                    AppString.create,
                    style: TextStyle(color: Color(0xff5ebd93)),
                  )),
            )
          ],
        ));
  }
}
