class Enrollment {
  final String name;
  final String email;
  final String mode;
  final String courseTitle;

  Enrollment({
    required this.name,
    required this.email,
    required this.mode,
    required this.courseTitle,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "mode": mode,
      "courseTitle": courseTitle,
    };
  }
}
