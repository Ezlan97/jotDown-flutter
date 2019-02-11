import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteListState();
  }
}

class NoteListState extends State<NoteList> {

  int count = 0;

  //scafold
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Jot Down'),
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => 'clicked',
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  //list view
  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        cardList();
      },
    );
  }

  //card
  Card cardList() {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.yellow,
          child: Icon(Icons.keyboard_arrow_right),
        ),
        title: Text('dummy title'),
        subtitle: Text('dummy date'),
        trailing: Icon(Icons.delete, color: Colors.grey,),

        onTap: () => debugPrint('ListTile Tapped'),
      ),
    );
  }
}