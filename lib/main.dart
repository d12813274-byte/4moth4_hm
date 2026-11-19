import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:hm4_moth4/ui/todo_list/my_todo_page.dart';

void main() {
  Bloc.observer = TalkerBlocObserver();
  runApp(const MaterialApp(home: MyTodoPage()));
}