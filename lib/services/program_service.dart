import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/program_model.dart';

class ProgramService {
  final String baseUrl = "https://68fce31e96f6ff19b9f69d6f.mockapi.io/api/edupro/programs";

  // Fetch all programs
  Future<List<Program>> fetchPrograms() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((e) => Program.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load programs");
    }
  }

  // Fetch single program by ID
  Future<Program> fetchProgramById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return Program.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load program details");
    }
  }
}
