import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Colors.pink, secondary: Colors.amber),
          fontFamily: 'Raleway',
          canvasColor: const Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData().textTheme.copyWith(
                titleMedium: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                ),
              )),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (context) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(toggleFavorite: _toggleFavorite, isFavorite: _isFavorite),
        AppRoutes.SETTINGS: (context) =>
            SettingsScreen(settings: settings, onSettingsChanged: _filterMeals),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const CategoriesScreen(),
      ),
    );
  }

  void _filterMeals() {
    setState(() {
      _availableMeals = dummyMeals.where((e) {
        return e.isGlutenFree == settings.isGlutenFree &&
            e.isLactoseFree == settings.isLactoseFree &&
            e.isVegan == settings.isVegan &&
            e.isVegetarian == settings.isVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }
}
