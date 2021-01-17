class TaskItem {
  String title;
  bool isDone;
  TaskItem({this.title, this.isDone});

  TaskItem.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        isDone = json['isDone'];


  Map<String, dynamic> toJson() => {
    'title': title,
    'isDone': isDone,
  };

}
