import 'package:flutter/widgets.dart';

class MyCard extends StatelessWidget {
  final Color color;
  final Widget child;
  final Function onTap;

  MyCard({@required this.color, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: this.child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
