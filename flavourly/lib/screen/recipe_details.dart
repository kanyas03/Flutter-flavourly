import 'dart:io';
import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            if (recipe.imagePath != null)
              Image.file(File(recipe.imagePath!), height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text('Ingredients',
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange[800])),
            SizedBox(height: 10),
            Text(recipe.ingredients, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Steps',
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange[800])),
            SizedBox(height: 10),
            Text(recipe.steps, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  } 
}
