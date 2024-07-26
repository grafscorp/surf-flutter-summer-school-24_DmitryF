// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';

class LoadingImageContainer extends StatefulWidget {
  const LoadingImageContainer({super.key});

  @override
  State<LoadingImageContainer> createState() => _LoadinIimagCcontainerState();
}

class _LoadinIimagCcontainerState extends State<LoadingImageContainer> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  late Timer _timer;
  final List _colors = [
    const Color.fromARGB(255, 28, 27, 26),
    const Color.fromARGB(255, 241, 238, 239),
  ];
  int _currentColorIndex = 0;
  void _startTimer() {
    // Set up a periodic timer that triggers the color change every 3 seconds
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _currentColorIndex = (_currentColorIndex + 1) % _colors.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            _colors[_currentColorIndex], // Use the current color
            _colors[(_currentColorIndex + 1) %
                _colors.length], // Use the next color in the list
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
