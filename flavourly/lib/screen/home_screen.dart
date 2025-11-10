import 'dart:io';
import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import 'addrecipe.dart';
import 'recipe_details.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> recipes = [];

  void addOrUpdateRecipe(Recipe recipe) {
    setState(() {
      final index = recipes.indexWhere((r) => r.id == recipe.id);
      if (index == -1) {
        recipes.add(recipe);
      } else {
        recipes[index] = recipe;
      }
    });
  }

  void deleteRecipe(int index) {
    setState(() {
      recipes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flavourly '),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: recipes.isEmpty
          ? Center(
              child: Text(
                'No recipes yet!\nTap + to add your first one.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: recipe.imagePath != null
                        ? Image.file(File(recipe.imagePath!),
                            width: 60, height: 60, fit: BoxFit.cover)
                        : Icon(Icons.fastfood, size: 40),
                    title: Text(recipe.title),
                    subtitle: Text(recipe.ingredients.length > 50
                        ? '${recipe.ingredients.substring(0, 50)}...'
                        : recipe.ingredients),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              RecipeDetailScreen(recipe: recipe),
                        ),
                      );
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AddOrEditRecipeScreen(
                                  recipe: recipe,
                                  onSave: addOrUpdateRecipe,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteRecipe(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddOrEditRecipeScreen(onSave: addOrUpdateRecipe),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
