import 'package:flutter/material.dart';
import 'package:flutter_personal_expenses_app/models/meal_model.dart';
import 'package:flutter_personal_expenses_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);
  
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() {
    // if we place the function to get data from route => ModalRoute
    /**
     * => Error will be occured: inheritFromElement() was called before
     *    _CategoryMealsScreenState.initState() completed
     * 
     * => The Problem is ModalRoute.of(context) is not liked in initState()
     * => context is a global property => it's not inside initState()
     * => because initState() run early
     * => initState() runs before our widget have been created,
     *      and before we have a context  for our widget
     */

    super.initState();
  }
  
  /** Lifecycle Hook
   * Called when a dependency of this [State] object changes.
   * - This method is also called immediately after [initState]
   * => if any state change => before rebuild by build()
   * => it will call didChangeDependencies() again
   */
  @override
  void didChangeDependencies() {
    /**
     * - use if (!_loadedInitData) Cuz
     * after initState() run => didChangeDependencies() is called
     * But on _removeMeal(), we setState => change State
     * 
     * => didChangeDependencies() will be called again => call 2 times
     */ 
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;

      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();

      _loadedInitData = true;    
    }

    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),

      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: null, 
            title: null, 
            imageUrl: null, 
            duration: null, 
            complexity: null, 
            affordability: null
          );
        } 
      )
    )
  }
}