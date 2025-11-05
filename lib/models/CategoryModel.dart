import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String icon; // store as string, map later
  final String color;
  final List<String> gradient;
  final int coursesCount;

  CategoryModel({
    required this.name,
    required this.icon,
    required this.color,
    required this.gradient,
    required this.coursesCount,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] ?? '',
      icon: json['icon'] ?? 'category',
      color: json['color'] ?? '#6C63FF',
      gradient: List<String>.from(json['gradient'] ?? ['#6C63FF', '#3A8DFF']),
      coursesCount: json['coursesCount'] ?? 0,
    );
  }

  IconData get iconData {
    switch (icon.toLowerCase()) {
      case 'code':
        return Icons.code_rounded;
      case 'palette':
        return Icons.palette_rounded;
      case 'finance':
        return Icons.account_balance_rounded;
      case 'marketing':
        return Icons.trending_up_rounded;
      case 'design':
        return Icons.design_services_rounded;
      default:
        return Icons.category_rounded;
    }
  }

  Color parseColor(String hex) {
    return Color(int.parse(hex.replaceFirst('#', '0xff')));
  }

  LinearGradient get gradientData {
    return LinearGradient(
      colors: gradient.map((g) => parseColor(g)).toList(),
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
