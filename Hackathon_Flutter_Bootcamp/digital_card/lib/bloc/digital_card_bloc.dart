import 'package:digital_card/bloc/digital_card_event.dart';
import 'package:digital_card/bloc/digital_card_state.dart';
import 'package:digital_card/database/supabase_function.dart';
import 'package:digital_card/model/course_model.dart';
import 'package:digital_card/model/login_model.dart';
import 'package:digital_card/model/student_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

bool isMatch = true;

class DigitalCardBloc extends Bloc<DigitalCardEvent, DigitalCardState> {
  DigitalCardBloc() : super(InitialState()) {
    on<GetDigitalCardInfoEvent>((event, emit) async {
      try {

        final List<LoginData> login = await SupabaseFunction()
            .checkLogin(email: event.email, password: event.password);
        if (event.email.isEmpty && event.password.isEmpty) {
          emit(ErrorStateBloc(message: 'Kindly fill all the field '));
        } else if (login[0].studentEmail == event.email &&
            login[0].studentPassword == event.password) {
          final List<StudentInfo> student = await SupabaseFunction()
              .getStudentInformation(studentID: login[0].studentId!);

          final List<CourseInfo> course = await SupabaseFunction()
              .getStudentCourses(
                  studentNationalID: student[0].studentNationalId!);

          emit(UpdateDigitalCardInfoState(student, course, login));
        }
      } catch (error) {
        print(error.toString());
        emit(ErrorStateBloc(message: 'Your Email or Password incorrect'));
      }
    });
  }
}
