import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_details_screen.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.title,
    required this.meals,
    // required this.onToggleFavorite,
  });

  final String title;
  final List<Meal> meals;
  // final void Function(Meal meal) onToggleFavorite; 

  void selectMeal(BuildContext context, Meal meal) {
    if (kDebugMode) {
      print(meal);
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          // onToggleFavorite: onToggleFavorite,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      // itemBuilder: (ctx, index) => Text(meals[index].title,style: const TextStyle(color: Colors.white),),
      itemBuilder: (ctx, index) => MealItem(
        meal: meals[index],
        onSelectMeal: (ctx, meal) {
          selectMeal(ctx, meal);
        },
      ),
    );
    if (meals.isEmpty) {
      content = Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            'Uh oh .. nothing here!',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ]),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
