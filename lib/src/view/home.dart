import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/src/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('오늘의 할일'),
        actions: [
          IconButton(
              onPressed: controller.signOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(
        () => Column(
          children: [
            _date(),
            SizedBox(
              height: 20,
            ),
            _create(),
            SizedBox(
              height: 20,
            ),
            _todoList(),
          ],
        ),
      ),
    );
  }

  Widget _create() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250,
          child: TextField(
            controller: controller.createController,
          ),
        ),
        ElevatedButton(
            onPressed: controller.create, child: const Icon(Icons.send))
      ],
    );
  }

  Widget _todoList() {
    return Expanded(
      child: ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          final todoModel = controller.todos[index];
          return ListTile(
            leading: (todoModel.isDone!)
                ? GestureDetector(
                    onTap: () {
                      controller.deleteTodo(todoModel.id!);
                    },
                    child: const Icon(
                      Icons.check,
                      color: Colors.green,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      controller.updateTodo(todoModel.id!);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.red,
                    ),
                  ),
            title: Text(todoModel.todo),
            subtitle: Text(todoModel.time.toString()),
          );
        },
      ),
    );
  }

  Widget _date() {
    DateTime now = DateTime.now();
    String formattedDate = ' ${now.month}월 ${now.day}일';
    return Center(
      child: Text(
        '${formattedDate}',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
