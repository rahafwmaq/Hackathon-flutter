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
        return Column(
          children: [
            TextWidget(
              text: state.courseInfo[0].courseName!,
              fontWeightText: FontWeight.w600,
              fontSizeText: 18,
              colorText: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextWidget(
                  text: 'Start : ${state.courseInfo[0].courseStart!}',
                  fontWeightText: FontWeight.w400,
                  fontSizeText: 18,
                  colorText: Colors.white,
                ),
                TextWidget(
                  text: 'End : ${state.courseInfo[0].courseEnd!}',
                  fontWeightText: FontWeight.w400,
                  fontSizeText: 18,
                  colorText: Colors.white,
                ),
              ],
            )
          ],
        );
      } else if (state is ErrorStateBloc) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      }
      return Container();
    });
  }
}
