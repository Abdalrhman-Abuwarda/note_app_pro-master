class Task{
  // Task({required this.title, required this.id, required this.student_id, required this.created_at, required this.updated_at, required this.is_done});
  late String title;
  late String student_id;
  late String updated_at;
  late String created_at;
  late int id;
  late bool is_done;

  Task.fromJson(Map<String, dynamic> json){
    title = json["title"];
    student_id = json["student_id"].toString();
    updated_at = json["updated_at"];
    created_at = json["created_at"];
    id = json["id"];
    is_done = json["is_done"];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["title"] = this.title;
    data["student_id"] = this.student_id;
    data["updated_at"] = this.updated_at;
    data["created_at"] = this.created_at;
    data["id"] = this.id;
    data["is_done"] = this.is_done;
    return data;
  }
  // static List<Task> tasks = [
    // Task(taskName: "task 1"),
    // Task(taskName: "task 2"),
    // Task(taskName: "task 3"),
    // Task(taskName: "task 4"),
    // Task(taskName: "task 5"),
  // ];
}