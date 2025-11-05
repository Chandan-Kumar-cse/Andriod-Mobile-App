import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/enrollment_model.dart';

class EnrollmentService {
  // Replace with your actual MockAPI endpoint
  final String baseUrl =
      "https://68fce31e96f6ff19b9f69d6f.mockapi.io/api/edupro/enrollments";

  Future<bool> submitEnrollment(Enrollment enrollment) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(enrollment.toJson()),
    );

    if (response.statusCode == 201) {
      return true;
    } else {
      print("Failed to submit: ${response.statusCode}");
      return false;
    }
  }
}
