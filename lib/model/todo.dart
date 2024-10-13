class ToDo {
  String id;
  String title;
  String description;
  DateTime Data;
  bool isDone;

  ToDo({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
    required this.Data,
  });
  static List<ToDo> todoList() {
    return [
      ToDo(
          id: '01',
          title: 'Tarefa 1',
          description: 'Primeira tarefa',
          Data: DateTime(2024, 10, 14)),
      ToDo(
        id: '02',
        title: 'Tarefa 2',
        description: 'Segunda tarefa',
        Data: DateTime(2024, 10, 14),
        isDone: true,
      ),
      ToDo(
        id: '03',
        title: 'Tarefa 3',
        description: 'Terceira tarefa',
        Data: DateTime(2024, 10, 14),
        isDone: true,
      ),
    ];
  }
}
