import 'package:flutter/material.dart';
import 'package:analog_clock/analog_clock.dart';

class AnalogClockWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final datetime = DateTime.now();

    return Card(
      elevation: 4,
      shadowColor: Colors.black,
      color: Colors.white,
      child: AnalogClock(
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.black),
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        width: 150,
        height: 150,
        isLive: true,
        hourHandColor: Colors.black,
        minuteHandColor: Colors.black,
        showSecondHand: true,
        numberColor: Colors.black87,
        showNumbers: true,
        showAllNumbers: true,
        textScaleFactor: 1.4,
        showTicks: true,
        showDigitalClock: true,
        useMilitaryTime: false,
        datetime: datetime,
      ),
    );
  }
}

class AnalogClockWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final datetime = DateTime.now();

    return AnalogClock(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('visit.png'),
        ),
        border: Border.all(width: 2.0, color: Colors.black),
        color: Colors.white54,
        shape: BoxShape.circle,
      ),
      width: 250,
      height: 250,
      isLive: true,
      hourHandColor: Colors.black,
      minuteHandColor: Colors.black,
      secondHandColor: Colors.deepOrange,
      showSecondHand: true,
      showTicks: true,
      showDigitalClock: true,
      digitalClockColor: Colors.black,
      showNumbers: true,
      showAllNumbers: true,
      numberColor: Colors.black87,
      textScaleFactor: 1.4,
      datetime: datetime,
    );
  }
}
