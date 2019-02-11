import 'package:flutter/material.dart';

class NoteDetail extends StatefulWidget {

  String appBarTitle;

  NoteDetail(this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {

  static var _priorities = ['High', 'Low'];
  String appBarTitle;
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  NoteDetailState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;

    // TODO: implement build
    return WillPopScope(

      //control result when user press action button
      onWillPop: () {

      },

      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(icon: 
            Icon(Icons.arrow_back), 
            onPressed: () {
              moveToLastScreen();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(13.0),
          child: ListView(
            children: <Widget>[
              
              //dropdown
              ListTile(
                title: DropdownButton(
                  items: _priorities.map((String dropDownStringItem) {
                    return DropdownMenuItem<String> (
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  style: TextStyle(),
                  value: 'Low',
                  onChanged: (valueSelectedByUser) {
                    setState(() {
                      debugPrint('User selected $valueSelectedByUser');
                    });
                  }
                ),
              ),

              //title
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint('Something is changed in title');
                  },
                  decoration: InputDecoration(
                    labelText: 'title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),

              //desc
              Padding(
                padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: TextField(
                  controller: titleController,
                  style: textStyle,
                  onChanged: (value) {
                    debugPrint('Something is changed in description');
                  },
                  decoration: InputDecoration(
                    labelText: 'description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    )
                  ),
                ),
              ),
              
              //button
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  children: <Widget>[
                    //save button
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint('save button clicked');
                          });
                        },
                      ),
                    ),

                    Container(width: 5.0,),

                    //delete button
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Delete',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            debugPrint('Delete button clicked');
                          });
                        },
                      ),
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      )
    );
  }

  //move to last screen function
  void moveToLastScreen() {
    Navigator.pop(context);
  }

}