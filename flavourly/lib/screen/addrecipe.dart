import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/recipe_model.dart';

class AddOrEditRecipeScreen extends StatefulWidget {
  final Recipe? recipe;
  final Function(Recipe) onSave;

  const AddOrEditRecipeScreen({super.key, this.recipe, required this.onSave});

  @override
  State<AddOrEditRecipeScreen> createState() => _AddOrEditRecipeScreenState();
}

class _AddOrEditRecipeScreenState extends State<AddOrEditRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _picker = ImagePicker();

  File? _selectedImage; // For Mobile/Desktop
  Uint8List? _webImage; // For Web

  late TextEditingController _titleController;
  late TextEditingController _ingredientsController;
  late TextEditingController _stepsController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.recipe?.title ?? '');
    _ingredientsController =
        TextEditingController(text: widget.recipe?.ingredients ?? '');
    _stepsController = TextEditingController(text: widget.recipe?.steps ?? '');

    // Load existing image if editing
    if (widget.recipe != null) {
      if (kIsWeb) {
        _webImage = widget.recipe!.webImage;
      } else if (widget.recipe!.imagePath != null) {
        _selectedImage = File(widget.recipe!.imagePath!);
      }
    }
  }

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      if (kIsWeb) {
        _webImage = await picked.readAsBytes();
      } else {
        _selectedImage = File(picked.path);
      }
      setState(() {});
    }
  }

  void _saveRecipe() {
    if (_formKey.currentState!.validate()) {
      String? imagePath;
      Uint8List? webImage;

      if (kIsWeb) {
        webImage = _webImage;
      } else {
        imagePath = _selectedImage?.path;
      }

      final recipe = Recipe(
        id: widget.recipe?.id ?? DateTime.now().toString(),
        title: _titleController.text,
        ingredients: _ingredientsController.text,
        steps: _stepsController.text,
        imagePath: imagePath,
        webImage: webImage,
      );

      widget.onSave(recipe);
      Navigator.pop(context);
    }
  }

  Widget _imagePreview() {
    if (kIsWeb) {
      if (_webImage != null) {
        return Image.memory(_webImage!, height: 200, fit: BoxFit.cover);
      }
    } else {
      if (_selectedImage != null) {
        return Image.file(_selectedImage!, height: 200, fit: BoxFit.cover);
      }
    }

    return Container(
      height: 200,
      color: Colors.grey[300],
      child: Icon(Icons.camera_alt, size: 60, color: Colors.grey[700]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.recipe != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Recipe' : 'Add Recipe'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: _imagePreview(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Recipe Title'),
                validator: (v) => v!.isEmpty ? 'Please enter title' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _ingredientsController,
                decoration: const InputDecoration(labelText: 'Ingredients'),
                maxLines: 3,
                validator: (v) =>
                    v!.isEmpty ? 'Please enter ingredients' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _stepsController,
                decoration: const InputDecoration(labelText: 'Steps'),
                maxLines: 4,
                validator: (v) => v!.isEmpty ? 'Please enter steps' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveRecipe,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                child: Text(isEdit ? 'Update Recipe' : 'Save Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
