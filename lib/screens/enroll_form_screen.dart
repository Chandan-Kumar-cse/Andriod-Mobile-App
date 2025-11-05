import 'package:edupro/screens/success_screen.dart';
import 'package:flutter/material.dart';

class EnrollFormScreen extends StatefulWidget {
  final String programTitle;

  const EnrollFormScreen({super.key, required this.programTitle});

  @override
  State<EnrollFormScreen> createState() => _EnrollFormScreenState();
}

class _EnrollFormScreenState extends State<EnrollFormScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();

  String? _selectedMode;
  final List<String> learningModes = ["Online", "Offline", "Hybrid"];

  late AnimationController _animationController;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _buttonAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // To allow gradient behind AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3A8DFF), Color(0xFF6AC1FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 60),
                  Text(
                    "Enroll in",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.programTitle,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Name Field
                  _buildInputField(
                      controller: _nameController,
                      label: "Full Name",
                      icon: Icons.person_outline,
                      validator: (value) =>
                      value!.isEmpty ? "Name cannot be empty" : null),

                  const SizedBox(height: 16),

                  // Email Field
                  _buildInputField(
                    controller: _emailController,
                    label: "Email Address",
                    icon: Icons.email_outlined,
                    validator: (value) {
                      if (value!.isEmpty) return "Email cannot be empty";
                      final emailRegex =
                      RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                      if (!emailRegex.hasMatch(value)) return "Enter a valid email";
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // Phone Field
                  _buildInputField(
                    controller: _phoneController,
                    label: "Phone Number",
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) return "Phone number cannot be empty";
                      if (!RegExp(r'^\+?\d{10,15}$').hasMatch(value)) {
                        return "Enter a valid phone number";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 16),

                  // Date of Birth Field
                  TextFormField(
                    controller: _dobController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Date of Birth",
                      prefixIcon: const Icon(Icons.calendar_today_outlined),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onTap: _pickDate,
                    validator: (value) =>
                    value!.isEmpty ? "Please select date of birth" : null,
                  ),

                  const SizedBox(height: 16),

                  // Address Field
                  _buildInputField(
                    controller: _addressController,
                    label: "Address",
                    icon: Icons.home_outlined,
                    validator: (value) =>
                    value!.isEmpty ? "Address cannot be empty" : null,
                  ),

                  const SizedBox(height: 16),

                  // Notes Field
                  _buildInputField(
                    controller: _notesController,
                    label: "Additional Notes",
                    icon: Icons.note_alt_outlined,
                    maxLines: 3,
                    validator: (value) => null,
                  ),

                  const SizedBox(height: 16),

                  // Learning Mode Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedMode,
                    hint: const Text("Select Learning Mode"),
                    items: learningModes
                        .map((mode) => DropdownMenuItem(
                      value: mode,
                      child: Text(mode),
                    ))
                        .toList(),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.school_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) => setState(() => _selectedMode = value),
                    validator: (value) =>
                    value == null ? "Please select a learning mode" : null,
                  ),

                  const SizedBox(height: 40),

                  // Animated Submit Button
                  GestureDetector(
                    onTapDown: (_) => _animationController.forward(),
                    onTapUp: (_) => _animationController.reverse(),
                    onTapCancel: () => _animationController.reverse(),
                    onTap: _submitForm,
                    child: ScaleTransition(
                      scale: _buttonAnimation,
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [Color(0xFF00C6FF), Color(0xFF3A8DFF)]),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0, 4),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    String? Function(String?)? validator,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
  }

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).unfocus(); // Close keyboard
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting Enrollment...')),
      );

      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => SuccessScreen(courseTitle: widget.programTitle),
          ),
        );
      });
    }
  }
}
