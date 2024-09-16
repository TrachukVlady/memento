import 'package:memento/originator/bloc/list_state.dart';

class ListMemento {
  final ListState _state;

  ListMemento(this._state);

  ListState get state => _state;
}
