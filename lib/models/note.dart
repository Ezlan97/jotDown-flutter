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

  //setter
  //title
  set title(String t) {
    if (t.length <= 255) {
      this._title = t; 
    }
  }

  //desc
  set desc(String d) {
    if (d.length <= 255) {
      this._desc = d;
    }
  }

  //created at
  set created_at(String c) {
    if (c.length <= 255) {
      this._created_at = c; 
    }
  }

  //priority
  set priority(String p) {
    if (p.length <= 255) {
      this._priority = p; 
    }
  }

  //convert Note Object to MAP object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }    
    map['title'] = _title;
    map['desc'] = _desc;
    map['created_at'] = _created_at;
    map['priority'] = _priority;

    return map;
  }

  //extract MAP object to Note object
  Note.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._desc = map['desc'];
    this._priority = map['priority'];
    this._created_at = map['created_at'];
  }
}