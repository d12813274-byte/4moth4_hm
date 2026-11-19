import 'package:bloc/bloc.dart';
import 'package:hm4_moth4/data/models/todo_model.dart';
import 'package:hm4_moth4/data/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _repository = TodoRepository();

  TodoBloc() : super(TodoInitial()) {
    on<LoadTodosEvent>((event, emit) async {
      emit(LoadingTodoState());
      try {
        final TodoModel todo = await _repository.getTodo();
        emit(LoadedTodoState(todo: todo));
      } catch (error) {
        emit(ErrorTodoState());
      }
    });
  }
}