import 'package:flex/flex.dart';

/// Base class for basic operator wrappers
abstract class OperatorWrapper {}

/// Implements indexing behaviour in the form of retrieval by, setting by, and removal by keys
class IndexingOperatorWrapper<K, V> implements OperatorWrapper {
  /// Creates a new instance of [IndexingOperatorWrapper]
  const IndexingOperatorWrapper(this.onGet, this.onSet, this.onRemove);

  /// Called to retrieve a value by key.
  final Value1Callback<K, V> onGet;

  /// Called to set a value by key.
  final Value2Callback<K, V, void> onSet;

  /// Called to remove a value by key.
  final Value1Callback<K, void> onRemove;

  /// Returns the value of `key`.
  V operator [](K key) => onGet(key);

  /// Sets the value of `key` to `value`.
  void operator []=(K key, V value) => onSet(key, value);

  /// Removes `key` and its value
  void operator |(K key) => onRemove(key);
}

/// Implements [List] indexing behaviour in the form of retrieval by, setting by, and removal by [int] keys
class ListOperatorWrapper<E> extends IndexingOperatorWrapper<int, E> {
  /// Creates a new instance of [ListOperatorWrapper]
  const ListOperatorWrapper(Value1Callback<int, E> onGet, Value2Callback<int, E, void> onSet, Value1Callback<int, void> onRemove) : super(onGet, onSet, onRemove);
}
