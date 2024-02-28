class ListModel {
  int id;
  String todo;
  bool complete;
  int userId;

  ListModel(
      {required this.id,
      required this.todo,
      required this.complete,
      required this.userId});


  factory ListModel.fromJson(Map<String, dynamic> json) {
    return ListModel(
      id: json['id'],
      todo: json['todo'],
      complete: json['completed'],
      userId: json['userId'],
    );
  }
}
