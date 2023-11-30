import 'package:digital_card/bloc/digital_card_bloc.dart';
import 'package:digital_card/bloc/digital_card_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

class StudentBarcode extends StatelessWidget {
  const StudentBarcode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DigitalCardBloc, DigitalCardState>(
      builder: (context, state) {
        if (state is UpdateDigitalCardInfoState) {
          return Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(47, 255, 255, 255),
              boxShadow: const [
                BoxShadow(color: Colors.black26, blurRadius: 40),
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: QrImageView(
                  data:
                      '${state.studentInfo[0].studentFirstName!} ${state.studentInfo[0].studentLastName!}',
                  version: QrVersions.auto,
                  size: 100,
                )),
          );
        } else if (state is ErrorStateBloc) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
        return Container();
      },
    );
  }
}
