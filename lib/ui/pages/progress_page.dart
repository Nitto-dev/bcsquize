import 'package:flutter/material.dart';
import 'package:new_quize/models/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressPage extends StatefulWidget {
  final Category category;


  ProgressPage({required this.category});

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  late String _totalQus='',_score='',_correctAns='',_incorrectAns='';
  void loadData()async{
    SharedPreferences _pref=await SharedPreferences.getInstance();
    setState(() {
      _totalQus=_pref.getString(widget.category.name+'_totalQus')!;
      _score=_pref.getString(widget.category.name+'_score')!;
      _correctAns=_pref.getString(widget.category.name+'_correct')!;
      _incorrectAns=_pref.getString(widget.category.name+'_inCorrect')!;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = TextStyle(
        color: Colors.black87,
        fontSize: 16.0,
        fontWeight: FontWeight.w500
    );
    final TextStyle trailingStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Last Progress'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Total Questions", style: titleStyle),
                  trailing: Text(_totalQus!=''?_totalQus:'0', style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Score", style: titleStyle),
                  trailing: Text(_score!=''?_score:'0', style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Correct Answers", style: titleStyle),
                  trailing: Text(_correctAns!=''?_correctAns:'0', style: trailingStyle),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Incorrect Answers", style: titleStyle),
                  trailing: Text(_incorrectAns!=''?_incorrectAns:'0', style: trailingStyle),
                ),
              ),
              SizedBox(height: 20.0),

            ],
          ),
        ),
      ),
    );
  }
}
