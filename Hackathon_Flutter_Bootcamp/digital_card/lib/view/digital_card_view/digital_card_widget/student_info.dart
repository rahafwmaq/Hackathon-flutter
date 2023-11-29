import 'package:digital_card/bloc/digital_card_bloc.dart';
import 'package:digital_card/bloc/digital_card_state.dart';
import 'package:digital_card/utils/custom_widgets/text_widget.dart';
import 'package:digital_card/utils/extension/layout.dart';
import 'package:digital_card/view/digital_card_view/digital_card_widget/student_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentInfoWidget extends StatelessWidget {
  const StudentInfoWidget({super.key,  });



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DigitalCardBloc, DigitalCardState>(
        builder: (context, state) {
      if (state is UpdateDigitalCardInfoState) {
        return Column(
          children: [
            //---------- Student Image -----------
            height20,
            const StudentImage(),

            //---------- Student info -----------
            height10,
            TextWidget(
              text:
                  '${state.studentInfo[0].studentFirstName!} ${state.studentInfo[0].studentSecondName!} ${state.studentInfo[0].studentLastName!}',
              fontWeightText: FontWeight.w500,
              fontSizeText: 18,
              colorText: Colors.black,
            ),
            TextWidget(
              text: state.studentInfo[0].studentNationalId!,
              fontWeightText: FontWeight.w300,
              fontSizeText: 15,
              colorText: Colors.black,
            ),
            TextWidget(
              text: state.studentInfo[0].studentCollage!,
              fontWeightText: FontWeight.w300,
              fontSizeText: 15,
              colorText: Colors.black,
            ),
            TextWidget(
              text: state.studentInfo[0].studentSpecialist!,
              fontWeightText: FontWeight.w300,
              fontSizeText: 15,
              colorText: Colors.black,
            ),
            TextWidget(
              text: state.studentInfo[0].studentPhoneNumber!,
              fontWeightText: FontWeight.w300,
              fontSizeText: 15,
              colorText: Colors.black,
            ),
            TextWidget(
              text: state.loginData[0].studentEmail!,
              fontWeightText: FontWeight.w300,
              fontSizeText: 15,
              colorText: Colors.black,
            ),
          ],
        );
      } else if (state is ErrorStateBloc) {
        print(state.message);
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text('throw ${state.message}')));
      }
      return Container();
    });
  }
}
