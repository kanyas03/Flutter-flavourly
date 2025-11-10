class Recipe {
  String id;
  String title;
  String ingredients;
  String steps;
  String? imagePath;

  Recipe({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.steps,
    this.imagePath,
  });
}
