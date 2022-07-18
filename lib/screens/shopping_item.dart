class ShoppingItem {
  final String name;
  bool done;
  ShoppingItem({
    required this.name,
    required this.done,
  });
  void setDone(newValue) {
    done = newValue;
  }

  ShoppingItem copyWith({
    String? name,
    bool? done,
  }) {
    return ShoppingItem(
      name: name ?? this.name,
      done: done ?? this.done,
    );
  }
}
