import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento/originator/bloc/list_bloc.dart';
import 'package:memento/originator/bloc/list_event.dart';
import 'package:memento/originator/bloc/list_state.dart';

class MementoExample extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  MementoExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Memento Pattern with Undo/Redo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {
              context.read<ListBloc>().add(UndoEvent());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter text'),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      context
                          .read<ListBloc>()
                          .add(AddItemEvent(_controller.text));
                      _controller.clear();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<ListBloc, ListState>(
              builder: (context, state) {
                final list = state.items;
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(list[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<ListBloc>().add(RemoveItemEvent(index));
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
