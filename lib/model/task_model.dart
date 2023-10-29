
import '../utils/exctract.dart';

class TaskModel{
  String? id ;
  String title;
  String description;
  DateTime dateTime;
  bool isDone;

  TaskModel({
   this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.isDone,
  });

  //convert  object to Map
  Map<String , dynamic> toFireStore(){
    //return map
   return {
     //لازم key يكون string
     "id" : id ,
     "title" : title ,
     "description" : description ,
     "dateTime" : ExtractDate.extractDate(dateTime).millisecondsSinceEpoch , //as the database to understand datetime
      "isDone" :isDone,

   };

  }


  //convert ( map ) to ( object )
  // used ( factory ) as to convert ( function ) to (  named constructor )
  factory TaskModel.formFireStore(Map <String , dynamic > json ){
    return TaskModel(
        id: json["id"], // write the same key of Map
        title: json["title"],
        description: json["description"],
        dateTime:  DateTime.fromMillisecondsSinceEpoch(json["dateTime"]), // as to convert from int to dataTime
        isDone: json["isDone"]
    );
  }

  /* //convert ( map ) to ( object )
  // = = named constructor
   TaskModel.formFireStore(Map <String , dynamic > json ) : this(
        id: json["id"], // write the same key of Map
        title: json["title"],
        description: json["description"],
        dateTime: DateTime.fromMillisecondsSinceEpoch(json["dateTime"]), // as to convert from int to dataTime
        isDone: json["isDone"]
    );

   */
}