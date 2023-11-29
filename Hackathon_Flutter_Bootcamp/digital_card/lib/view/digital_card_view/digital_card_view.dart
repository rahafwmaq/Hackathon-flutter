import 'package:digital_card/utils/custom_widgets/text_widget.dart';
import 'package:digital_card/utils/extension/layout.dart';
import 'package:digital_card/utils/extension/navigator.dart';
import 'package:digital_card/view/digital_card_view/digital_card_widget/student_barcode.dart';
import 'package:digital_card/view/digital_card_view/digital_card_widget/student_course_info.dart';
import 'package:digital_card/view/digital_card_view/digital_card_widget/student_info.dart';
import 'package:digital_card/view/login_view/login_view.dart';
import 'package:flutter/material.dart';

class DigitalCardView extends StatelessWidget {
  const DigitalCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const TextWidget(
            text: 'Digital Card',
            fontWeightText: FontWeight.w300,
            fontSizeText: 30,
            colorText: Colors.black,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.push(page: LoginView());
                },
                icon: const Icon(Icons.logout))
          ]),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Container(
              height: 380,
              width: 350,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 40),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StudentInfoWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Divider(),
                  ),
                  StudentCourseInfoWidget()
                ],
              ),
            ),

            height20,
            //-------------------- Barcode ----------------
            const StudentBarcode(),
          ],
        ),
      )),
    );
  }
}
