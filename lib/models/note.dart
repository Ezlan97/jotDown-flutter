class Note {

  //all database data
  int _id;
  String _title;
  String _desc;
  String _created_at;
  int _priority;

  //database constructor
  Note(this._title, this._created_at, this._priority, [this._desc]);
  Note.withId(this._id, this._title, this._created_at, this._priority, [this._desc]);

  //setter and getter
  int get id => _id;
  String get title => _title;
  String get desc => _desc;
  String get created_at => _created_at;
  int get priority => _priority;
}