import 'package:flutter/material.dart';
//import 'package:meditation_app/constants.dart';

class CategoryCard extends StatelessWidget {
  final IconData svgSrc;
  final String title;
  //final Function press;

  const CategoryCard({
    required this.svgSrc,
    required this.title,
    //required this.press,
  }) ;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Colors.amber,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            //onTap:()=>press,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Spacer(),
                  // SvgPicture.asset(svgSrc),
                  Icon(svgSrc,size: 50,color: Colors.white70,),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(context)
                        .textTheme
                        .title!
                        .copyWith(fontSize: 18,color: Colors.white70,),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}