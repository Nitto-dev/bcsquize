import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_quize/models/category.dart' as subCat;

class MainCategory{
  final int id;
  final String name;
  final dynamic icon;
  final Color color;
  final List<subCat.Category>subCategory;

  MainCategory(this.id, this.name, {this.icon, required this.color,required this.subCategory});
}

final List<MainCategory>mainCategory=[
  MainCategory(1, 'General Knowledge', icon: FontAwesomeIcons.globeAsia,color: Colors.cyan,subCategory: subCat.categories),
  MainCategory(18,"Computer", icon: FontAwesomeIcons.laptopCode,color: Colors.pink,subCategory: []),
  MainCategory(19,"Maths", icon: FontAwesomeIcons.sortNumericDown,color: Colors.green,subCategory: []),
  MainCategory(21,"Sports", icon: FontAwesomeIcons.footballBall,color: Colors.amber,subCategory: []),
  MainCategory(22,"Geography", icon: FontAwesomeIcons.mountain,color: Colors.red,subCategory: []),
  MainCategory(23,"History", icon: FontAwesomeIcons.monument,color: Colors.blueGrey,subCategory: []),
  MainCategory(25,"Art", icon: FontAwesomeIcons.paintBrush,color: Colors.deepPurple,subCategory: []),

];