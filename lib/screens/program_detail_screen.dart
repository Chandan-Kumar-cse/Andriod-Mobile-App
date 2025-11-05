import 'package:flutter/material.dart';
import '../models/program_model.dart';
import '../services/program_service.dart';
import '../widgets/error_retry_widget.dart';
import '../widgets/shimmer_loader.dart';
import 'enroll_form_screen.dart';

class ProgramDetailScreen extends StatefulWidget {
  final String programId;
  const ProgramDetailScreen({super.key, required this.programId});

  @override
  State<ProgramDetailScreen> createState() => _ProgramDetailScreenState();
}

class _ProgramDetailScreenState extends State<ProgramDetailScreen> {
  late Future<Program> programFuture;

  @override
  void initState() {
    super.initState();
    programFuture = ProgramService().fetchProgramById(widget.programId);
  }

  @override
  Widget build(BuildContext context) {
    const gradientColors = [Color(0xFF6C63FF), Color(0xFF3A8DFF)];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),

      // 🌈 Gradient AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              "Course Details",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),

      // 🧠 Main Content
      body: FutureBuilder<Program>(
        future: programFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Shimmer placeholder
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ShimmerLoader(height: 200, width: double.infinity, radius: 16),
                  SizedBox(height: 20),
                  ShimmerLoader(height: 20, width: 200),
                  SizedBox(height: 12),
                  ShimmerLoader(height: 14, width: 100),
                  SizedBox(height: 20),
                  ShimmerLoader(height: 16, width: double.infinity),
                  SizedBox(height: 8),
                  ShimmerLoader(height: 16, width: double.infinity),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return ErrorRetryWidget(
              message:
              "Unable to load program details.\nPlease check your connection.",
              onRetry: () {
                setState(() {
                  programFuture =
                      ProgramService().fetchProgramById(widget.programId);
                });
              },
            );
          } else if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          }

          final program = snapshot.data!;

          // ✅ Main UI when data is loaded
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🖼 Course Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    program.image,
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),

                // 📘 Title
                Text(
                  program.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B1D3A),
                  ),
                ),
                const SizedBox(height: 8),

                // ⭐ Rating and Price
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      "${program.rating}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 16),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        "₹${program.price}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 📄 About
                const Text(
                  "About Course",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B1D3A),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  program.description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(height: 32),

                // 👨‍🏫 Instructor Section
                const Text(
                  "Instructor",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B1D3A),
                  ),
                ),
                const SizedBox(height: 12),

                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                        NetworkImage("https://picsum.photos/200?${program.id}"),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            program.instructor,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1B1D3A),
                            ),
                          ),
                          const Text(
                            "Design Mentor",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),

      // 🚀 Enroll Button
      bottomNavigationBar: FutureBuilder<Program>(
        future: programFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError ||
              !snapshot.hasData) {
            return const SizedBox.shrink();
          }

          final program = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EnrollFormScreen(programTitle: program.title),
                  ),
                );
              },
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.purple.withOpacity(0.25),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Enroll Course",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
