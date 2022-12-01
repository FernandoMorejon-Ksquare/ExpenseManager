import 'package:flutter/material.dart';
import 'package:itk_project3/constants/app_string.dart';
import 'package:itk_project3/provider/provider.dart';
import 'package:itk_project3/screens/home.dart';
import 'package:provider/provider.dart';

class AddConceptScreen extends StatefulWidget {
  AddConceptScreen({Key? key}) : super(key: key);

  @override
  State<AddConceptScreen> createState() => _AddConceptScreenState();
}

class _AddConceptScreenState extends State<AddConceptScreen> {
  int messageIndex = 0;

  final List<Widget> _widgetBottom = <Widget>[
    const Text(""),
    const Text(
      "You must enter a value in all fields",
      style: TextStyle(
          color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    const Text(
      "The amount can't be zero or negative.",
      style: TextStyle(
          color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
    )
  ];

  final TextEditingController _titleCtrl = TextEditingController();

  final TextEditingController _amountCtrl = TextEditingController();

  final TextEditingController _descCtrl = TextEditingController();

  bool isIncome = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5ebd93),
        title: Text(
          AppString.createConcept,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Radio(
                    activeColor: Colors.black,
                    value: true,
                    onChanged: (val) {
                      setState(() {
                        isIncome = true;
                      });
                    },
                    groupValue: isIncome,
                  ),
                  Text(
                    AppString.income,
                    style:
                        const TextStyle(color: Color(0xff5ebd93), fontSize: 18),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Radio(
                    activeColor: Colors.black,
                    value: false,
                    onChanged: (val) {
                      setState(() {
                        isIncome = false;
                      });
                    },
                    groupValue: isIncome,
                  ),
                  Text(
                    AppString.expense,
                    style:
                        const TextStyle(color: Color(0xff5ebd93), fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                key: Key('titleTextField'),
                maxLength: 15,
                controller: _titleCtrl,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppString.title,
                    labelStyle:
                        const TextStyle(color: Colors.grey, fontSize: 22)),
              ),
              const SizedBox(height: 8),
              TextField(
                key: Key('amountTextField'),
                keyboardType: TextInputType.number,
                maxLength: 9,
                controller: _amountCtrl,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: AppString.amount,
                    labelStyle:
                        const TextStyle(color: Colors.grey, fontSize: 22)),
              ),
              const SizedBox(height: 8),
              TextField(
                key: Key('descTextField'),
                controller: _descCtrl,
                maxLines: 5,
                maxLength: 250,
                decoration: InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                    labelText: AppString.description,
                    labelStyle:
                        const TextStyle(color: Colors.grey, fontSize: 22)),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: Key('addTaskButton'),
                  onPressed: () {
                    if (_titleCtrl.text is String &&
                        _titleCtrl.text.isNotEmpty &&
                        num.tryParse(_amountCtrl.text) is num &&
                        _descCtrl.text is String &&
                        _descCtrl.text.isNotEmpty) {
                      if (num.tryParse(_amountCtrl.text)! > 0) {
                        String now = DateFormat('d-M-y hh:mm aaa')
                            .format(DateTime.now());
                        Provider.of<ConceptProvider>(
                          context,
                          listen: false,
                        ).addConcept(
                            _titleCtrl.text,
                            double.parse((num.tryParse(_amountCtrl.text))!
                                .toStringAsFixed(2)),
                            _descCtrl.text,
                            isIncome,
                            now);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      } else {
                        setState(() {
                          messageIndex = 2;
                        });
                      }
                    } else {
                      setState(() {
                        messageIndex = 1;
                      });
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(vertical: 15)),
                    backgroundColor: const MaterialStatePropertyAll<Color>(
                        Color(0xff5ebd93)),
                  ),
                  child: Text(
                    AppString.submit,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              _widgetBottom.elementAt(messageIndex),
            ],
          ),
        ),
      ),
    );
  }
}
