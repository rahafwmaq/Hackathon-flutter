class CourseInfo {
  int? courseId;
  String? courseName;
  String? courseStart;
  String? courseEnd;
  String? studentId;

  CourseInfo(
      {this.courseId,
      this.courseName,
      this.courseStart,
      this.courseEnd,
      this.studentId});

  CourseInfo.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    courseName = json['course_name'];
    courseStart = json['course_start'];
    courseEnd = json['course_end'];
    studentId = json['student_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['course_name'] = this.courseName;
    data['course_start'] = this.courseStart;
    data['course_end'] = this.courseEnd;
    data['student_id'] = this.studentId;
    return data;
  }
}
