import 'dart:typed_data';

class Recipe {
  String id;
  String title;
  String ingredients;
  String steps;
  String? imagePath; // For mobile (local file path)
  Uint8List? webImage; // For web (in-memory image bytes)

  Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.steps,
    this.imagePath,
    this.webImage,
  });
}
