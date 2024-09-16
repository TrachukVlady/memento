import 'package:memento/memento/list_memento.dart';
import 'package:memento/originator/bloc/list_state.dart';

class HistoryManager {
  final List<ListMemento> _undoStack = [];

  void saveState(ListState state) {
    _undoStack.add(ListMemento(state));
  }

  ListState? undo() {
    if (_undoStack.isNotEmpty) {
      final lastMemento = _undoStack.removeLast();
      return lastMemento.state;
    }
    return null;
  }
}
