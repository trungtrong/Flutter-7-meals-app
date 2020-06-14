import 'package:flutter/material.dart';
import 'package:flutter_personal_expenses_app/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTitle(String title, IconData icon, Function tapHandler) {
    return ListTitle(
      leading: Icon(
        icon,
        size: 26
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'QuickSand',
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor
              ),
            ),
          ),

          SizedBox(height: 20),

          _buildListTitle(
            'Meals',
            Icons.restaurant,
            () {
              /**
               * pushReplacementNamed() don't like pushNamed
               * => it doesn't add the new page on the top of it in that Stack
               * of pages
               *  => But it replaces the existing page
               */
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),

          _buildListTitle(
            'Filters',
            Icons.settings,
            () {
              Navigator.of(context).pushReplacementNamed(
                FiltersScreen.routeName
              )
            }
          )
        ],
      ),
    )
  }
}