import 'package:digital_card/bloc/digital_card_event.dart';
import 'package:digital_card/bloc/digital_card_state.dart';
import 'package:digital_card/database/supabase_function.dart';
import 'package:digital_card/model/course_model.dart';
import 'package:digital_card/model/login_model.dart';
import 'package:digital_card/model/student_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DigitalCardBloc extends Bloc<DigitalCardEvent, DigitalCardState> {
  DigitalCardBloc() : super(InitialState()) {
    on<GetDigitalCardInfoEvent>((event, emit) async {
      try {
        final List<LoginData> email = await SupabaseFunction()
            .checkLogin(columnName: 'student_email', value: event.email);

        final List<LoginData> password = await SupabaseFunction()
            .checkLogin(columnName: 'student_password', value: event.password);

        if (email[0].studentEmail == event.email &&
            password[0].studentPassword == event.password) {
          final List<StudentInfo> student = await SupabaseFunction()
              .getStudentInformation(studentID: email[0].studentId!);

          final List<CourseInfo> course = await SupabaseFunction()
              .getStudentCourses(
                  studentNationalID: student[0].studentNationalId!);

          print(student[0].studentCollage);
          print(course[0].courseName);
          print(email[0].studentEmail);

          print(email[0].studentPassword);

          emit(UpdateDigitalCardInfoState(student, course, email));
        }
      } catch (error) {
        emit(ErrorStateBloc(message: error.toString()));
      }
    });
  }
}
