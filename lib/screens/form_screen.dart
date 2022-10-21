import 'package:flutter/material.dart';
import 'package:my_first_app_test/constants/key_constants.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final myController = TextEditingController();
  String textFieldValue = '';
  List<String> items = <String>['Item 1', 'Item 2', 'Item 3'];
  String dropdownValue = 'Item 1';
  bool isChecked = false;

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('CLOSE'),
          ),
        ],
        content: const Text('Hi from here'),
        title: const Text('Dialog'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Text(
              'Dropdown Widget',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            DropdownButton<String>(
              key: SecondPageKeys.dropdownKey,
              elevation: 16,
              items: items.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
              onChanged: (String? value) {
                setState(
                  () {
                    dropdownValue = value!;
                  },
                );
              },
              value: dropdownValue,
            ),
            const Text(
              'TextField',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            TextFormField(
              controller: myController,
              onChanged: (String newValue) {
                textFieldValue = myController.text;
              },
              decoration: const InputDecoration(
                labelText: 'Enter a text',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Checkbox'),
                Checkbox(
                  onChanged: (value) => setState(
                    () => isChecked = !isChecked,
                  ),
                  value: isChecked,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showDialog(context),
        tooltip: 'Show Dialog',
        child: const Icon(Icons.ads_click),
      ),
    );
  }
}
