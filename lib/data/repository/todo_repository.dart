import 'package:dio/dio.dart';
import 'package:hm4_moth4/data/models/todo_model.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';


class TodoRepository {
  TodoRepository() {
    _dio.interceptors.add(TalkerDioLogger());
  }

  final Dio _dio = Dio();

  Future<TodoModel> getTodo() async {
    final Response response = await _dio.get('https://dummyjson.com/todos/2');
    return TodoModel.fromJson(response.data);
  }
}