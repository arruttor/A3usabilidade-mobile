import 'package:flutter/material.dart';

import '../model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onTodoChange;
  final onDeleteItem;

  const TodoItem(
      {super.key,
      required this.todo,
      required this.onDeleteItem,
      required this.onTodoChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: () {
          onTodoChange(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: const Color.fromRGBO(251, 216, 220, 1),
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Color.fromARGB(255, 89, 89, 250),
        ),
        //adicionar o checkbox
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              todo.title,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: todo.isDone ? TextDecoration.lineThrough : null),
            ),
            const SizedBox(
                height: 20), // Aumente o valor para ter mais espaçamento
          ],
        ),
        subtitle: Text(
          todo.description,
          style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              fontWeight: FontWeight.w500,
              decoration: todo.isDone ? TextDecoration.lineThrough : null),
        ),
        titleAlignment: ListTileTitleAlignment.top,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                print('Primeiro ícone clicado!');
              },
              child: const Icon(Icons.edit),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
                onDeleteItem(todo.id);
              },
              child: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
