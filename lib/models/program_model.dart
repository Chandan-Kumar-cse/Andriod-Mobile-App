class Program {
  final String id;
  final String title;
  final String category;
  final double price;
  final double rating;
  final String image;
  final String description;
  final String instructor;

  Program({
    required this.id,
    required this.title,
    required this.category,
    required this.price,
    required this.rating,
    required this.image,
    required this.description,
    required this.instructor,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'].toString(),
      title: json['title'],
      category: json['category'] ?? '',
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      instructor: json['instructor'] ?? '',
    );
  }
}
