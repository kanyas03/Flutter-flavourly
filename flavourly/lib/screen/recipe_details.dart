import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (!kIsWeb && recipe.imagePath != null) {
      imageWidget = Image.file(File(recipe.imagePath!),
          height: 200, fit: BoxFit.cover);
    } else if (kIsWeb && recipe.webImage != null) {
      imageWidget = Image.memory(recipe.webImage!,
          height: 200, fit: BoxFit.cover);
    } else {
      imageWidget = Container(
        height: 200,
        color: Colors.grey[300],
        child: Icon(Icons.camera_alt, size: 60, color: Colors.grey[700]),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            imageWidget,
            const SizedBox(height: 16),
            Text(
              'Ingredients',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800]),
            ),
            const SizedBox(height: 10),
            Text(recipe.ingredients, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text(
              'Steps',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[800]),
            ),
            const SizedBox(height: 10),
            Text(recipe.steps, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
