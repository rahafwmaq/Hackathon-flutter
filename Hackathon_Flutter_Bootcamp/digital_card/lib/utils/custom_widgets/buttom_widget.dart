import 'package:digital_card/utils/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ButtomWidget extends StatelessWidget {
  const ButtomWidget(
      {super.key, required this.textButtom, required this.onPressd});

  final String textButtom;
  final Function() onPressd;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(193, 165, 137, 213),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // button's shape
        ),
      ),
      onPressed: onPressd,
      child: TextWidget(
        text: textButtom,
        fontSizeText: 20,
        fontWeightText: FontWeight.w300,
        colorText: Colors.white,
      ),
    );
  }
}
