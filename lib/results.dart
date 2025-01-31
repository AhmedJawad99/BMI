import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  const Results(
      {super.key,
      required this.result,
      required this.isMale,
      required this.age});
  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase {
    String resultText = '';
    if (result >= 30)
      resultText = 'Obese';
    else if (result > 25 && result < 30)
      resultText = 'Overwieght';
    else if (result >= 18 && result <= 24.9)
      resultText = 'Normal';
    else
      resultText = 'Thin';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Gender: ${isMale ? 'Male' : 'Female'}',
                  style: Theme.of(context).textTheme.labelMedium),
              Text(
                'Result: ${result.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Healthiness: $resultPhrase ',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                'Age: $age',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
