import 'dart:math';

import 'package:bmi_calculator/results_screen.dart';
import 'package:bmi_calculator/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  dynamic _themeicon = Icons.light_mode;
  bool isMale = true;
  int height = 100;
  int age = 20;
  int weight = 40;
  late double results;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _getContainerColor(context),
        actions: [_switchthemeicon()],
        centerTitle: true,
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        !isMale
                            ? setState(() {
                                isMale = true;
                              })
                            : {};
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: isMale
                              ? Theme.of(context).colorScheme.primaryContainer
                              : _getContainerColor(context),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 70.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'MALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        isMale
                            ? setState(() {
                                isMale = false;
                              })
                            : {};
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: isMale
                              ? _getContainerColor(context)
                              : Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              size: 70.0,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _getContainerColor(context),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$height',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      allowedInteraction: SliderInteraction.slideOnly,
                      min: 50.0,
                      max: 300.0,
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _getContainerColor(context),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'age',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '$age',
                            style: const TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: '-a',
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    age -= 1;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                ),
                              ),
                              FloatingActionButton(
                                heroTag: '+a',
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    age += 1;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: _getContainerColor(context),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'weight',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            '$weight',
                            style: const TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: '+w',
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    weight -= 1;
                                  });
                                },
                                child: const Icon(
                                  Icons.remove,
                                ),
                              ),
                              FloatingActionButton(
                                heroTag: '-w',
                                mini: true,
                                onPressed: () {
                                  setState(() {
                                    weight += 1;
                                  });
                                },
                                child: const Icon(
                                  Icons.add,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Theme.of(context).colorScheme.primaryContainer,
            width: double.infinity,
            child: MaterialButton(
              onPressed: () {
                double results = weight / pow(height / 100, 2);
                String gender = isMale ? 'Male' : 'Female';
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Results(
                        age: age,
                        gender: gender,
                        results: results.round(),
                      ),
                    ));
              },
              height: 50.0,
              child: const Text(
                'Calculate',
              ),
            ),
          )
        ],
      ),
    );
  }

  Color _getContainerColor(BuildContext context) {
    Color containerColor = Theme.of(context).focusColor;
    return containerColor;
  }

  Widget _switchthemeicon() {
    final provider = Provider.of<ThemeProvider>(context);
    return IconButton(
      icon: Icon(_themeicon),
      onPressed: () {
        setState(() {
          if (_themeicon == Icons.light_mode) {
            _themeicon = Icons.dark_mode;
          } else {
            _themeicon = Icons.light_mode;
          }
        });
        provider.toggleTheme();
      },
    );
  }
}
