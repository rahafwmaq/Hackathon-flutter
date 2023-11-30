import 'package:digital_card/bloc/digital_card_bloc.dart';
import 'package:digital_card/bloc/digital_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentImage extends StatelessWidget {
  const StudentImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DigitalCardBloc, DigitalCardState>(
        builder: (context, state) {
      if (state is UpdateDigitalCardInfoState) {
        return Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                color: state.studentInfo[0].studentGraduate == false
                    ? Colors.green
                    : const Color.fromARGB(255, 96, 95, 95),
                width: 15),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 40),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              "assets/${state.studentInfo[0].studentNationalId}.png",
            ),
          ),
        );
      } else if (state is ErrorStateBloc) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.message)));
      }
      return Container();
    });
  }
}
