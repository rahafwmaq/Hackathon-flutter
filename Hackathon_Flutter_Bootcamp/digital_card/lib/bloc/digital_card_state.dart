import 'package:digital_card/model/course_model.dart';
import 'package:digital_card/model/login_model.dart';
import 'package:digital_card/model/student_model.dart';

abstract class DigitalCardState {}

final class InitialState extends DigitalCardState {}

final class UpdateDigitalCardInfoState extends DigitalCardState {
  final List<LoginData> loginData;
  final List<StudentInfo> studentInfo;
  final List<CourseInfo> courseInfo;

  UpdateDigitalCardInfoState(this.studentInfo, this.courseInfo, this.loginData);
}

final class ErrorStateBloc extends DigitalCardState {
  final String message;
  ErrorStateBloc({required this.message});
}
