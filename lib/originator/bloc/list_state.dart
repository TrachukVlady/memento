class ListState {
  final List<String> items;

  ListState({this.items = const []});

  ListState copyWith({List<String>? items}) {
    return ListState(
      items: items ?? this.items,
    );
  }
}
