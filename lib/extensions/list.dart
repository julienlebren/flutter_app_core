part of extensions;

extension ListX<E> on List<E> {
  List<E> sortedBy(Comparable Function(E e) key) =>
      this..sort((a, b) => key(a).compareTo(key(b)));
}
