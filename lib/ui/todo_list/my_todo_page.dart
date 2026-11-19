import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hm4_moth4/ui/todo_list/bloc/todo_bloc.dart';

class MyTodoPage extends StatefulWidget {
  const MyTodoPage({super.key});

  @override
  State<MyTodoPage> createState() => _MyTodoPageState();
}

class _MyTodoPageState extends State<MyTodoPage> {
  final TodoBloc _todoBloc = TodoBloc();

  @override
  void dispose() {
    _todoBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Задача')),
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: _todoBloc,
        builder: (context, state) {
          if (state is LoadingTodoState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LoadedTodoState) {
            return ListTile(
              title: Text(state.todo.todo),
              trailing: Icon(
                state.todo.completed ? Icons.check_circle : Icons.circle_outlined,
              ),
            );
          } else if (state is ErrorTodoState) {
            return const Center(child: Text('Ошибка'));
          }
          return const Center(child: Text('Нажми кнопку'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _todoBloc.add(LoadTodosEvent()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}