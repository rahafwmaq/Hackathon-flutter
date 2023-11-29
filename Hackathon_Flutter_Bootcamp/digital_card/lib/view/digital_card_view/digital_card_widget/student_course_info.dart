import 'package:digital_card/bloc/digital_card_bloc.dart';
import 'package:digital_card/bloc/digital_card_state.dart';
import 'package:digital_card/utils/custom_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentCourseInfoWidget extends StatelessWidget {
  const StudentCourseInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DigitalCardBloc, DigitalCardState>(
        builder: (context, state) {
      if (state is UpdateDigitalCardInfoState) {
        //print('2222222222222222222222222222222222    ${state.studentInfo[0]}');
        return Column(
          children: [
            TextWidget(
              text: state.courseInfo[0].courseName!,
              fontWeightText: FontWeight.w500,
              fontSizeText: 18,
              colorText: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWidget(
                  text: 'Start : ${state.courseInfo[0].courseStart!}',
                  fontWeightText: FontWeight.w300,
                  fontSizeText: 18,
                  colorText: Colors.black,
                ),
                TextWidget(
                  text: 'End : ${state.courseInfo[0].courseEnd!}',
                  fontWeightText: FontWeight.w300,
                  fontSizeText: 18,
                  colorText: Colors.black,
                ),
              ],
            )
          ],
        );
      } else if (state is ErrorStateBloc) {
        print(state.message);
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text('throw ${state.message}')));
      }
      return CircularProgressIndicator();
    });
  }
}
