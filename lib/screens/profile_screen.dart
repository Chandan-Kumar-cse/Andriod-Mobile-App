import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gradient = const LinearGradient(
      colors: [Color(0xFF6C63FF), Color(0xFF3A8DFF)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: gradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Profile Card
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        // Profile Image
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, size: 60, color: Colors.white),
                            ),
                            Positioned(
                              bottom: 4,
                              right: 4,
                              child: Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Color(0xFF6C63FF), width: 2),
                                ),
                                child: const Icon(Icons.image, size: 20, color: Color(0xFF6C63FF)),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 16),

                        const Text(
                          'AVINASH',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C2C2C),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'avinash0205@outlook.com',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 24),

                        // Options List
                        _buildOption(Icons.edit, "Edit Profile"),
                        _buildOption(Icons.payment, "Payment Option"),
                        _buildOption(Icons.notifications_none, "Notifications"),
                        _buildOption(Icons.security, "Security"),
                        _buildOption(Icons.language, "Language", trailing: "English (US)"),
                        _buildOption(Icons.dark_mode, "Dark Mode"),
                        _buildOption(Icons.article_outlined, "Terms & Conditions"),
                        _buildOption(Icons.help_outline, "Help Center"),
                        _buildOption(Icons.group_add, "Invite Friends"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(IconData icon, String title, {String? trailing}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF6C63FF)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: trailing != null
            ? Text(
          trailing,
          style: const TextStyle(color: Color(0xFF3A8DFF), fontWeight: FontWeight.bold),
        )
            : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Colors.grey.shade100,
      ),
    );
  }
}
