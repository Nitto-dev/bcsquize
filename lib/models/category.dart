import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Category{
  final int id;
  final String name;
  final String subTitle;
  final dynamic icon;
  Category(this.id, this.name,this.subTitle, {this.icon});

}

final List<Category> categories = [
  Category(9,"General Knowledge",'chapter 1', icon: FontAwesomeIcons.globeAsia),
  Category(10,"General Knowledge",'chapter 2', icon: FontAwesomeIcons.globeAsia),
  Category(11,"General Knowledge",'chapter 3', icon: FontAwesomeIcons.globeAsia),


];