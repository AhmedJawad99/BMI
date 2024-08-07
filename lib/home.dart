import 'dart:math';

import 'package:bmi/results.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightVal = 170;
  int weight = 55;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  gender(context, 'Male'),
                  gender(context, 'Female'),
                ],
              ),
              Row(
                children: [
                  tall(context, 'Male'),
                ],
              ),
              Row(
                children: [
                  weightAndAge(context, 'Weight'),
                  weightAndAge(context, 'Age'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                color: Colors.teal,
                child: TextButton(
                    onPressed: () {
                      var result = weight / pow(heightVal / 100, 2);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return Results(
                            result: result, isMale: isMale, age: age);
                      }));
                    },
                    child: Text(
                      'Calculate',
                      style: Theme.of(context).textTheme.labelMedium,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Expanded gender(BuildContext context, String type) {
    return Expanded(
        child: InkWell(
      onTap: () {
        setState(() {
          isMale = (type == 'Male') ? true : false;
        });
      },
      child: Card(
        color: (isMale && type == 'Male') || (!isMale && type == 'Female')
            ? Colors.teal
            : Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            type == 'Male' ? const Icon(Icons.male) : const Icon(Icons.female),
            const SizedBox(
              height: 15,
            ),
            Text(
              type,
              style: Theme.of(context).textTheme.labelMedium,
            )
          ],
        ),
      ),
    ));
  }

  Expanded tall(BuildContext context, String type) {
    return Expanded(
        child: Card(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Height',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  heightVal.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  'CM',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Slider(
                thumbColor: Colors.teal,
                inactiveColor: Colors.white38,
                activeColor: Colors.teal,
                value: heightVal,
                min: 1,
                max: 200,
                onChanged: (val) {
                  setState(() {
                    heightVal = val;
                  });
                })
          ],
        ),
      ),
    ));
  }

  Expanded weightAndAge(BuildContext context, String type) {
    return Expanded(
        child: Card(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == 'Weight' ? '$weight' : '$age',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.teal,
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age-- : weight--;
                    });
                  },
                  mini: true,
                  heroTag: type == 'Age' ? 'Age--' : 'Weight--',
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.teal,
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age++ : weight++;
                    });
                  },
                  mini: true,
                  heroTag: type == 'Age' ? 'Age++' : 'Weight++',
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
