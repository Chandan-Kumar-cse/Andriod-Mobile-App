import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  EditProfilePageState createState() => EditProfilePageState();
}

class EditProfilePageState extends State<EditProfilePage> {
  File? _profileImage;
  final picker = ImagePicker();
  final _formKey = GlobalKey<FormState>();
  String gender = 'Male';
  String studentStatus = 'Yes';

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _profileImage = File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        _profileImage != null
                            ? FileImage(_profileImage!)
                            : null,
                    child:
                        _profileImage == null
                            ? const Icon(Icons.camera_alt, size: 40)
                            : null,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField('Full Name'),
              _buildTextField('Nick Name'),
              _buildTextField('Date of Birth'),
              _buildTextField('Email'),
              _buildPhoneField(),
              _buildDropdown('Gender', ['Male', 'Female', 'Other'], gender, (
                String? val,
              ) {
                if (val != null) setState(() => gender = val);
              }),
              _buildDropdown('Student', ['Yes', 'No'], studentStatus, (
                String? val,
              ) {
                if (val != null) setState(() => studentStatus = val);
              }),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Profile Updated')),
                    );
                  }
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label) => TextFormField(
    decoration: InputDecoration(labelText: label),
    validator: (value) => value!.isEmpty ? 'Enter $label' : null,
  );

  Widget _buildPhoneField() => TextFormField(
    decoration: const InputDecoration(
      labelText: 'Phone Number',
      prefixText: '+91 ',
    ),
    keyboardType: TextInputType.phone,
    validator: (value) => value!.isEmpty ? 'Enter phone number' : null,
  );

  Widget _buildDropdown(
    String label,
    List<String> items,
    String selected,
    ValueChanged<String?> onChanged,
  ) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(labelText: label),
      // initialValue: selected,
      items:
          items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
      onChanged: onChanged,
    );
  }
}
