import 'package:digital_card/model/course_model.dart';
import 'package:digital_card/model/login_model.dart';
import 'package:digital_card/model/student_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFunction {
  Future<List<LoginData>> checkLogin(
      {required String email, required String password}) async {
    final supabase = Supabase.instance.client;
    final List data = await supabase
        .from('student_login')
        .select()
        .match({"student_email": email, "student_password": password});

    List<LoginData> loginStudentData = [];
    for (var element in data) {
      loginStudentData.add(LoginData.fromJson(element));
    }

    return loginStudentData;
  }

  Future<List<StudentInfo>> getStudentInformation(
      {required int studentID}) async {
    final supabase = Supabase.instance.client;
    final List data = await supabase
        .from('student_info')
        .select()
        .eq('student_id', studentID);
    print("\n\n============== Student info ===================");
    print(data);
    print("===============================================\n\n");

    List<StudentInfo> studentInfoList = [];
    for (var element in data) {
      studentInfoList.add(StudentInfo.fromJson(element));
    }

    return studentInfoList;
  }

  Future<List<CourseInfo>> getStudentCourses(
      {required String studentNationalID}) async {
    final supabase = Supabase.instance.client;
    final List data = await supabase
        .from('course_info')
        .select()
        .eq('student_id', studentNationalID);

    print("\n\n============== course info ===================");
    print(data.toString());
    print("===============================================\n\n");

    List<CourseInfo> courseInfoList = [];
    for (var element in data) {
      courseInfoList.add(CourseInfo.fromJson(element));
    }

    return courseInfoList;
  }
}
