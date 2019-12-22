/// The code in this file is derived from the Dart SDK [here](https://github.com/dart-lang/sdk/blob/master/sdk/lib/collection/list.dart) written by the Dart project authors.

import 'dart:collection' show ListMixin;
import 'dart:math';

import 'package:flex/flex.dart';
import 'package:meta/meta.dart';

/// Mixin for an unmodifiable [List] class.
///
/// This overrides all mutating methods with methods that throw.
/// This mixin is intended to be mixed in on top of [ListMixin] on
/// unmodifiable lists.
mixin UnmodifiableListMixin<E> on List<E> {
  /// This operation is not supported by an unmodifiable list.
  @override
  void operator []=(int index, E value) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  set length(int newLength) {
    throw UnsupportedError('Cannot change the length of an unmodifiable list');
  }

  @override
  set first(E element) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  @override
  set last(E element) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void setAll(int at, Iterable<E> iterable) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void add(E value) {
    throw UnsupportedError('Cannot add to an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void insert(int index, E element) {
    throw UnsupportedError('Cannot add to an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void insertAll(int at, Iterable<E> iterable) {
    throw UnsupportedError('Cannot add to an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void addAll(Iterable<E> iterable) {
    throw UnsupportedError('Cannot add to an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  bool remove(Object element) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void removeWhere(Value1Callback<E, bool> test) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void retainWhere(Value1Callback<E, bool> test) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void sort([Comparator<E> compare]) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void shuffle([Random random]) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void clear() {
    throw UnsupportedError('Cannot clear an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  E removeAt(int index) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  E removeLast() {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void removeRange(int start, int end) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void replaceRange(int start, int end, Iterable<E> iterable) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  /// This operation is not supported by an unmodifiable list.
  @override
  void fillRange(int start, int end, [E fillValue]) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }
}

/// Abstract implementation of an unmodifiable list.
///
/// All operations are defined in terms of `length` and `operator[]`,
/// which need to be implemented.
// ignored because the class-mixin is in another library
//ignore: prefer_mixin
abstract class UnmodifiableListBase<E> with ListMixin<E>, UnmodifiableListMixin<E> {
  /// Creates a new instance of [UnmodifiableListBase].
  //ignore: const_constructor_with_mixin_with_field
  const UnmodifiableListBase();
}

/// An unmodifiable [List] view of another List.
///
/// The source of the elements may be a [List] or any [Iterable] with
/// efficient [Iterable.length] and [Iterable.elementAt].
class UnmodifiableListView<E> extends UnmodifiableListBase<E> {
  /// Creates an unmodifiable list backed by [source].
  ///
  /// The [source] of the elements may be a [List] or any [Iterable] with
  /// efficient [Iterable.length] and [Iterable.elementAt].
  const UnmodifiableListView(this.internalList);

  /// The internal representation of the unmodifiable list. Not guarunteed to be unmodifiable.
  @protected
  final Iterable<E> internalList;

  @override
  List<R> cast<R>() => UnmodifiableListView(internalList.cast<R>());

  @override
  int get length => internalList.length;

  @override
  E operator [](int index) => internalList.elementAt(index);
}
