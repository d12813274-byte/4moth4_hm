class TodoModel {
  TodoModel(this.id, this.todo, this.completed, this.userId);

  final int id;
  final String todo;
  final bool completed;
  final int userId;

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(json['id'], json['todo'], json['completed'], json['userId']);
  }
}