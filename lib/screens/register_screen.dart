import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _selectedCountry;
  bool _agree = false;
  bool _obscurePass = true;
  bool _obscureConfirm = true;
  bool _isLoading = false;

  final List<String> _countries = [
    'India',
    'United States',
    'United Kingdom',
    'Canada',
    'Australia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFF6A5AE0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.school,
                            color: Colors.white, size: 50),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "EDUPRO",
                        style: TextStyle(
                          color: Color(0xFF3A2E8A),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "LEARN FROM HOME",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                // Image.asset('assets/logo.png', height: 90),
                const SizedBox(height: 10),
                const Text(
                  "Getting Started.!",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B1D3A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Create an Account to Continue your Courses",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                _buildTextField(
                    controller: _fnameController,
                    label: "First Name",
                    icon: Icons.person_outline),
                const SizedBox(height: 15),
                _buildTextField(
                    controller: _lnameController,
                    label: "Last Name",
                    icon: Icons.person_outline),
                const SizedBox(height: 15),
                _buildTextField(
                    controller: _emailController,
                    label: "Email",
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress),
                const SizedBox(height: 15),

                // DOB
                TextFormField(
                  controller: _dobController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    prefixIcon: const Icon(Icons.calendar_today),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      _dobController.text =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                    }
                  },
                  validator: (value) =>
                  value!.isEmpty ? "Please select your DOB" : null,
                ),
                const SizedBox(height: 15),

                // Country
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Country of Nationality",
                    prefixIcon: const Icon(Icons.flag_outlined),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                  ),
                  value: _selectedCountry,
                  items: _countries
                      .map((country) => DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  ))
                      .toList(),
                  onChanged: (value) => setState(() => _selectedCountry = value),
                  validator: (value) =>
                  value == null ? "Please select your country" : null,
                ),
                const SizedBox(height: 15),

                // Password
                _buildTextField(
                    controller: _passwordController,
                    label: "Create Password",
                    icon: Icons.lock_outline,
                    obscureText: _obscurePass,
                    suffix: IconButton(
                      icon: Icon(_obscurePass
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () =>
                          setState(() => _obscurePass = !_obscurePass),
                    )),
                const SizedBox(height: 15),

                _buildTextField(
                    controller: _confirmPasswordController,
                    label: "Confirm Password",
                    icon: Icons.lock_outline,
                    obscureText: _obscureConfirm,
                    suffix: IconButton(
                      icon: Icon(_obscureConfirm
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () =>
                          setState(() => _obscureConfirm = !_obscureConfirm),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please confirm your password";
                      }
                      if (value != _passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    }),
                const SizedBox(height: 15),

                Row(
                  children: [
                    Checkbox(
                        value: _agree,
                        onChanged: (v) => setState(() => _agree = v ?? false),
                        activeColor: const Color(0xFF3A8DFF)),
                    const Expanded(
                      child: Text("Agree to Terms & Conditions",
                          style: TextStyle(color: Colors.grey)),
                    )
                  ],
                ),
                const SizedBox(height: 10),

                _isLoading
                    ? const CircularProgressIndicator()
                    : SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _registerUser,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF3A8DFF),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    child: const Text("Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 20),
                const Text("Or Continue With",
                    style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _SocialCircle(icon: Icons.g_mobiledata_outlined),
                    const SizedBox(width: 20),
                    _SocialCircle(icon: Icons.apple_outlined),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    Widget? suffix,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator:
      validator ?? (value) => value!.isEmpty ? "Please enter $label" : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget _socialIcon(String path) => Container(
    height: 45,
    width: 45,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4))
      ],
    ),
    child: Image.asset(path),
  );

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate() || !_agree) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Please complete all fields & agree to terms.")));
      return;
    }

    setState(() => _isLoading = true);

    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Account created successfully!"),
        backgroundColor: Colors.green,
      ));

      _formKey.currentState!.reset();
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Registration failed")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
class _SocialCircle extends StatelessWidget {
  final IconData icon;
  const _SocialCircle({required this.icon});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.white,
      child: Icon(icon, color: Colors.black, size: 28),
    );
  }
}
