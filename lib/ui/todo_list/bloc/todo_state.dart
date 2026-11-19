part of 'todo_bloc.dart';

sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class LoadingTodoState extends TodoState {}

final class LoadedTodoState extends TodoState {
  LoadedTodoState({required this.todo});

  final TodoModel todo;
}

final class ErrorTodoState extends TodoState {}