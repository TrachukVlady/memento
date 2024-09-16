import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memento/caretaker/history_manager.dart';

import 'list_event.dart';
import 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  final HistoryManager _historyManager = HistoryManager();

  ListBloc() : super(ListState()) {
    on<AddItemEvent>(_onAddItem);
    on<RemoveItemEvent>(_onRemoveItem);
    on<UndoEvent>(_onUndo);
  }

  void _onAddItem(AddItemEvent event, Emitter<ListState> emit) {
    _historyManager.saveState(state);
    final updatedItems = List<String>.from(state.items)..add(event.item);
    emit(state.copyWith(items: updatedItems));
  }

  void _onRemoveItem(RemoveItemEvent event, Emitter<ListState> emit) {
    _historyManager.saveState(state);
    final updatedItems = List<String>.from(state.items)..removeAt(event.index);
    emit(state.copyWith(items: updatedItems));
  }

  void _onUndo(UndoEvent event, Emitter<ListState> emit) {
    final previousState = _historyManager.undo();
    if (previousState != null) {
      emit(previousState);
    }
  }
}
