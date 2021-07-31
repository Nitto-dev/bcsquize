import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  final int id;
  final String name;
  final dynamic icon;
  Category(this.id, this.name, {this.icon});

}

final List<Category> categories = [
  Category(9,"General Knowledge", icon: FontAwesomeIcons.globeAsia),
  Category(18,"Computer", icon: FontAwesomeIcons.laptopCode),
  Category(19,"Maths", icon: FontAwesomeIcons.sortNumericDown),
  Category(21,"Sports", icon: FontAwesomeIcons.footballBall),
  Category(22,"Geography", icon: FontAwesomeIcons.mountain),
  Category(23,"History", icon: FontAwesomeIcons.monument),
  Category(25,"Art", icon: FontAwesomeIcons.paintBrush),

];