import 'package:flutter/material.dart';
import 'main.dart';

class TopStack extends StatelessWidget {
  const TopStack({
    super.key,
    required this.widget,
  });

  final FormsHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Image(
            image: AssetImage('assets/logo/forms_intro_logo.png'),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            widget.title,
            style: TextStyle(
              color: Colors.purple[900],
            ),
          ),
        ),
      ],
    );
  }
}
