import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier():super([]);
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((_meal) => _meal.id != meal.id).toList();
      return false;
    } else {
      //adding item to the immutable list
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref){
  return FavoriteMealsNotifier();
});
