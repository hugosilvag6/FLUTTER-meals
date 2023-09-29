enum Complexity { simple, medium, difficult }

enum Cost { cheap, fair, expensive }

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final Cost cost;
  final Complexity complexity;

  const Meal({
    required this.cost,
    required this.complexity,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Fácil";
      case Complexity.medium:
        return "Normal";
      case Complexity.difficult:
        return "Difícil";
      default:
        return "Desconhecida";
    }
  }

  String get costText {
    switch (cost) {
      case Cost.cheap:
        return "Barato";
      case Cost.fair:
        return "Justo";
      case Cost.expensive:
        return "Caro";
      default:
        return "Desconhecido";
    }
  }
}
