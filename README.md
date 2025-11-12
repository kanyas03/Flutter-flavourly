# 🍽️ Flavourly – Food Recipe Management App

Flavourly is a simple Flutter-based mobile application that allows users to add, view, update, and delete food recipes. It provides a clean and interactive interface to manage your favorite dishes, making it easy to organize and explore various recipes in one place.

**🚀 Features**

- Add Recipes: Easily create new recipes with titles, ingredients, and instructions.

- View Recipes: Browse and view details of saved recipes in a user-friendly layout.

- Update Recipes: Modify existing recipe details at any time.

- Delete Recipes: Remove unwanted or outdated recipes from the list.

- Simple UI: Built using Flutter’s Material Design for a smooth and modern experience.

**🧩 Project Structure**
```
Flavourly/
│
├── lib/
│   ├── main.dart                 # Entry point of the app
│   ├── model/
│   │   └── recipe_model.dart     # Defines the Recipe data model
│   ├── screen/
│   │   ├── home_screen.dart      # Displays the list of recipes
│   │   ├── add_recipe.dart       # Screen to add a new recipe
│   │   ├── update_recipe.dart    # Screen to update an existing recipe
│   │   └── view_recipe.dart      # Screen to view recipe details
│   └── widget/
│       └── recipe_card.dart      # Custom widget for displaying recipes
│
└── pubspec.yaml                  # Defines dependencies and assets
```

**⚙️ Technologies Used**

- Framework: Flutter

- Language: Dart

- IDE: Android Studio / VS Code

- Platform: Android, iOS

**📲 How to Run**

Install Flutter SDK
.

Clone this repository:

git clone https://github.com/kanyas03/Flutter-flavourly


**Open the project in your preferred IDE**.

```
Run the following command to install dependencies:

flutter pub get


Launch the app on an emulator or a physical device:

flutter run

```
### 🧠 Usage

**➕ Add a Recipe**

- Tap the Add Recipe button on the Home Screen.

- Enter the recipe name, ingredients, and instructions.

- Press Save to add it to your recipe list.

**👀 View a Recipe**

Tap on a recipe card from the home screen to see the full details.

**✏️ Update a Recipe**

Open a recipe and tap the Edit icon.

Modify the fields and press Update to save changes.

**🗑️ Delete a Recipe**

On the recipe view page, tap the Delete button to remove it permanently.

**💡 About**

This project was created as part of an internship task to demonstrate CRUD (Create, Read, Update, Delete) functionalities in a Flutter application.
