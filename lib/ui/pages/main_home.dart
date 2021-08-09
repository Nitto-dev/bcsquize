import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:custom_clippers/Clippers/sin_cosine_wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:new_quize/models/main_category.dart';
import 'package:new_quize/ui/pages/home.dart';
import 'package:new_quize/utils/toast_masg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:new_quize/utils/toast_masg.dart' as toast;
class MainHome extends StatelessWidget {
  final List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nitto Quiz'),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: SinCosineWaveClipper(),
              child: Container(
                decoration:
                BoxDecoration(color: Theme.of(context).primaryColor),
                height: 200,
              ),
            ),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      "Select a category to start the quiz",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: MediaQuery.of(context).size.width >
                              1000
                              ? 7
                              : MediaQuery.of(context).size.width > 600 ? 5 : 3,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0),
                      delegate: SliverChildBuilderDelegate(
                        _buildCategoryItem,
                        childCount: mainCategory.length,
                      )),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    MainCategory category = mainCategory[index];
    return MaterialButton(
      elevation: 1.0,
      highlightElevation: 1.0,
      onPressed: () {
        if(category.subCategory.isNotEmpty){
          Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,child: HomePage(category.subCategory,category.color)));
        }else{
          if(category.subCategory==[]){
            toast.warningMassage("Content is ready yet!");
          }
        }
      },
      //_categoryPressed(context, category),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.grey.shade800,
      textColor: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (category.icon != null) Icon(category.icon),
          if (category.icon != null) SizedBox(height: 5.0),
          AutoSizeText(
            category.name,
            minFontSize: 10.0,
            textAlign: TextAlign.center,
            maxLines: 3,
            wrapWords: false,
          ),
        ],
      ),
    );
  }

  /*_categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }*/
}