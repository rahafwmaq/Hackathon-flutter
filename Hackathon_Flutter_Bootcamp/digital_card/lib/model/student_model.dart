class StudentInfo {
  String? studentFirstName;
  String? studentNationalId;
  String? studentCollage;
  String? studentSpecialist;
  String? studentPhoneNumber;
  String? studentSecondName;
  String? studentLastName;
  int? studentCourse;
  bool? studentGraduate;
  int? studentId;

  StudentInfo(
      {this.studentFirstName,
      this.studentNationalId,
      this.studentCollage,
      this.studentSpecialist,
      this.studentPhoneNumber,
      this.studentSecondName,
      this.studentLastName,
      this.studentCourse,
      this.studentGraduate,
      this.studentId});

  StudentInfo.fromJson(Map<String, dynamic> json) {
    studentFirstName = json['student_first_name'];
    studentNationalId = json['student_national_id'];
    studentCollage = json['student_collage'];
    studentSpecialist = json['student_specialist'];
    studentPhoneNumber = json['student_phone_number'];
    studentSecondName = json['student_second_name'];
    studentLastName = json['student_last_name'];
    studentCourse = json['student_course'];
    studentGraduate = json['student_graduate'];
    studentId = json['student_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_first_name'] = this.studentFirstName;
    data['student_national_id'] = this.studentNationalId;
    data['student_collage'] = this.studentCollage;
    data['student_specialist'] = this.studentSpecialist;
    data['student_phone_number'] = this.studentPhoneNumber;
    data['student_second_name'] = this.studentSecondName;
    data['student_last_name'] = this.studentLastName;
    data['student_course'] = this.studentCourse;
    data['student_graduate'] = this.studentGraduate;
    data['student_id'] = this.studentId;
    return data;
  }
}
