class LoginData {
  int? studentId;
  String? studentEmail;
  String? studentPassword;

  LoginData({this.studentId, this.studentEmail, this.studentPassword});

  LoginData.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    studentEmail = json['student_email'];
    studentPassword = json['student_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['student_email'] = this.studentEmail;
    data['student_password'] = this.studentPassword;
    return data;
  }
}