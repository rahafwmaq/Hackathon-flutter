import 'package:digital_card/bloc/digital_card_bloc.dart';
import 'package:digital_card/bloc/digital_card_state.dart';
import 'package:digital_card/utils/custom_widgets/text_widget.dart';
import 'package:digital_card/utils/extension/layout.dart';
import 'package:digital_card/utils/extension/navigator.dart';
import 'package:digital_card/utils/extension/screen_resposive.dart';
import 'package:digital_card/view/digital_card_view/digital_card_widget/student_barcode.dart';
import 'package:digital_card/view/digital_card_view/digital_card_widget/student_course_info.dart';
import 'package:digital_card/view/digital_card_view/digital_card_widget/student_info.dart';
import 'package:digital_card/view/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DigitalCardView extends StatelessWidget {
  const DigitalCardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.heightFullScreen(),
        width: context.widthFullScreen(),
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 159, 200, 222),
            Color.fromARGB(255, 171, 141, 220)
          ], begin: Alignment.topRight, end: Alignment.bottomRight),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                BlocBuilder<DigitalCardBloc, DigitalCardState>(
                    builder: (context, state) {
                  if (state is UpdateDigitalCardInfoState) {
                    return SizedBox(
                      width: context.widthFullScreen(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text:
                                'Hello, ${state.studentInfo[0].studentFirstName}',
                            fontWeightText: FontWeight.w300,
                            fontSizeText: 35,
                            colorText: Colors.white,
                          ),
                          IconButton(
                              onPressed: () {
                                context.push(page: LoginView());
                              },
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.white,
                                size: 30,
                              ))
                        ],
                      ),
                    );
                  }
                  return Container();
                }),
                height20,
                Container(
                  height: 380,
                  width: 350,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 40),
                    ],
                    color: const Color.fromARGB(47, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //---------- Student Info -----------

                      StudentInfoWidget(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Divider(),
                      ),

                      //---------- Student Course Info -----------

                      StudentCourseInfoWidget()
                    ],
                  ),
                ),

                height20,
                //-------------------- Student Barcode ----------------
                const StudentBarcode(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
