import 'package:flutter/material.dart';

class CurrencyConvertor extends StatefulWidget {
  const CurrencyConvertor({super.key});

  @override
  State<CurrencyConvertor> createState() => _CurrencyConvertorState();
}

class _CurrencyConvertorState extends State<CurrencyConvertor> {
  // Creating a textediting controller

  TextEditingController textEditingController = TextEditingController();
  double amount = 0;

  @override
/*************  ✨ Codeium Command ⭐  *************/
/// Builds the UI for the Currency Convertor widget. This includes:
/// - An AppBar with the title "Currency Convertor".
/// - A center-aligned column containing:
///   - A Text widget displaying the converted amount.
///   - A TextField to input the amount to be converted.
///   - An ElevatedButton to trigger the conversion, multiplying the input by 80.

/******  25c6b3c3-4242-4674-b236-38a672cb5ac8  *******/
  Widget build(BuildContext context) {
    // Multiply with something
    void multiply() {
      setState(() {
        amount = double.parse(textEditingController.text) * 80;
        textEditingController.clear();
      });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Currency Convertor"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              amount.toString(),
              style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[800]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.monetization_on,
                  ),
                  prefixIconColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  hintText: 'Please enter an amount: ',
                  labelStyle: TextStyle(
                    color: Colors.white60,
                  ),
                ),
              ),
            ),

            // Rounded button
            // Appears like a text
            // Add a text button with text "Convert"
            ElevatedButton(
              onPressed: () {
                multiply();
              },
              style: TextButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.blueGrey[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 12),
              child: Text(
                "Convert",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
