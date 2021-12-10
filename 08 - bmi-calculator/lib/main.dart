import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        //primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(
          color: Color(0xFF0A0E21),
        ),
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          thumbColor: Color(0xFFEB1555),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayColor: Color(0x29EB1555),
          trackHeight: 2.0,
          trackShape: RectangularSliderTrackShape(),
          inactiveTrackColor: Color(0xFF8D8E98),
        ),
      ),
      home: InputPage(),
    );
  }
}
