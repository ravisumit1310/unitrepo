import 'package:flutter/material.dart';

void main() {
  runApp(const UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  const UnitConverterScreen({super.key});

  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  String selectedUnit = 'Meter';
  double inputValue = 0.0;
  double convertedValue = 0.0;

  Map<String, double> conversionMap = {
    'Meter': 1.0,
    'Kilometer': 1000.0,
    'Mile': 1609.34,
    'Foot': 0.3048,
  };

  void convertValue() {
    double conversionFactor = conversionMap[selectedUnit]!;
    setState(() {
      convertedValue = inputValue * conversionFactor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unit Converter Oisis'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Enter a value:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  inputValue = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text(
              'Select a unit:',
              style: TextStyle(fontSize: 18.0),
            ),
            DropdownButton<String>(
              value: selectedUnit,
              onChanged: (value) {
                setState(() {
                  selectedUnit = value!;
                });
              },
              items: conversionMap.keys.map((unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(unit),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: convertValue,
              child: Text('Convert'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Converted value in meters:',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              convertedValue.toString(),
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
