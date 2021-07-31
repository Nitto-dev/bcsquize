import 'package:custom_clippers/Clippers/directional_wave_clipper.dart';
import 'package:custom_clippers/Clippers/sin_cosine_wave_clipper.dart';
import 'package:flutter/material.dart';
import 'package:new_quize/models/category.dart';
import 'package:new_quize/ui/pages/progress_page.dart';
import 'package:new_quize/ui/widgets/content_html_load.dart';
import 'package:new_quize/ui/widgets/custom_card.dart';
import 'package:new_quize/ui/widgets/quiz_options.dart';
import 'package:page_transition/page_transition.dart';

class SectionPage extends StatelessWidget {
  Category category;

  SectionPage(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${category.name} Section"),
          elevation: 0,
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            ClipPath(
              clipper: DirectionalWaveClipper(),
              child: Container(
                decoration:
                BoxDecoration(color: Theme.of(context).primaryColor),
                height: 200,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: ()=>_categoryPressed(context,category),
                            child: Container(
                              height: 200,
                                width: MediaQuery.of(context).size.width*.8/2,
                                child: CategoryCard(svgSrc: category.icon, title: category.name,)),
                          ),
                          InkWell(
                            onTap: ()=>Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,child: ContentHtmlLoad(category:category))),
                            child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width*.8/2,
                                child: CategoryCard(svgSrc: Icons.text_snippet, title: "Learn ${category.name}")),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: ()=>Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft,child: ProgressPage(category:category))),
                        child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width*1.8/2,
                            child: CategoryCard(svgSrc: Icons.legend_toggle, title: "${category.name} Progress")),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  _categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
        onClosing: () {},
      ),
    );
  }
}
