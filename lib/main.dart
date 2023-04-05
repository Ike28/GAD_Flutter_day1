import 'package:flutter/material.dart';

void main() {
  runApp(const ConvertorApp());
}

class ConvertorApp extends StatelessWidget {
  const ConvertorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: const ConvertorHomePage(title: 'Currency convertor'),
    );
  }
}

class ConvertorHomePage extends StatefulWidget {
  const ConvertorHomePage({super.key, required this.title});

  final String title;

  @override
  State<ConvertorHomePage> createState() => _ConvertorHomePageState();
}

class _ConvertorHomePageState extends State<ConvertorHomePage> {
  String _resultMessage = "";
  String _validationMessage = "";

  final TextEditingController sumController = TextEditingController();

  void _showConversion() {
    setState(() {
      if (sumController.text.isEmpty) {
        _validationMessage = "Please enter a valid number";
        _resultMessage = "";
      } else {
        _validationMessage = "";
        var result = (double.parse(sumController.text) * 4.9).toStringAsFixed(
            2);
        _resultMessage = '$result RON';
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text(widget.title)),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/money.jpg'),
            TextFormField(
              controller: sumController,
              keyboardType: TextInputType.number, decoration: const InputDecoration(
                hintText: 'Enter the amount in EUR'),
            ),

            Text(
                _validationMessage,
                style: const TextStyle(color:Colors.red)
            ),
            TextButton(
              onPressed: _showConversion,

              child: const Text("CONVERT",
                  style: TextStyle(fontSize: 20))
            ),

            Text(
                _resultMessage,
                style: const TextStyle(fontSize: 25)
            ),
          ],
        ),
      ),
    );
  }
}