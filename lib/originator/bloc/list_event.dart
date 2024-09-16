abstract class ListEvent {}

class AddItemEvent extends ListEvent {
  final String item;

  AddItemEvent(this.item);
}

class RemoveItemEvent extends ListEvent {
  final int index;

  RemoveItemEvent(this.index);
}

class UndoEvent extends ListEvent {}
