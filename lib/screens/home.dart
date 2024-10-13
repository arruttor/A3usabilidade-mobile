import 'package:flutter/material.dart';

import '../model/todo.dart';
import '../widgets/todo-item.dart';

final todosLists = ToDo.todoList();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _biuldAppBar(),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              //searchBox(),  // Adicionar a pesquisa
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50, bottom: 20),
                      child: const Text(
                        'All ToDos',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    for (ToDo itens in todosLists)
                      TodoItem(
                        todo: itens,
                        onTodoChange: _handleToDoChange,
                        onDeleteItem: _deleteToDoItem,
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(242, 143, 153, 1),
                        padding: EdgeInsets.all(0),
                        elevation: 10,
                        minimumSize: Size(60, 60)),
                    onPressed: () {},
                    child: Text(
                      '+',
                      style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    )),
              )
            ],
          ),
        )
      ]),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosLists.removeWhere((item) => item.id == id);
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(251, 216, 220, 1),
          borderRadius: BorderRadius.circular(20)),
      child: const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 25,
            ),
            prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 30),
            border: InputBorder.none,
            hintText: 'buscar'),
      ),
    );
  }

  AppBar _biuldAppBar() {
    return AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Row(
          children: [
            Icon(
              Icons.menu,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 30,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 4)),
            Text(
              'To-do List',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  fontWeight: FontWeight
                      .w500 // Você pode especificar o peso (light, regular, bold, etc.)
                  ),
            ),
          ],
        ));
  }
}
