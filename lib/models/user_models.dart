class CrudModel {
  int? userId;
  String? title;
  bool? completed;
  String? id;  


  CrudModel({ this.id,  this.title, this.completed, this.userId});

  factory CrudModel.fromJson(Map<String, dynamic> json) {
    return CrudModel(
      id: json[ "id"],
      title: json['title'],
      completed: json['completed'],
      userId: json['userId']
    );
  }

  Map<String,dynamic>toJson(){
      return{
        'id':id,
        'title':title,
        'completed':completed,
        'userId':userId
      }  ;   }

}


