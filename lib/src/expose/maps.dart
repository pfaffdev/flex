/// The code in this file is derived from the Dart SDK [here](https://github.com/dart-lang/sdk/blob/master/sdk/lib/collection/maps.dart) written by the Dart project authors.

import 'package:flex/flex.dart';
import 'package:meta/meta.dart';

/// Wrapper around a class that implements [Map] that only exposes `Map`
/// members.
///
/// A simple wrapper that delegates all `Map` members to the map provided in the
/// constructor.
///
/// Base for delegating map implementations like [UnmodifiableMapView].
class MapView<K, V> implements Map<K, V> {
  /// Creates a new instance of `MapView`
  const MapView(this.internalMap);

  /// The internal representation of the unmodifiable map. Not guarunteed to be unmodifiable.
  @protected
  final Map<K, V> internalMap;

  @override
  Map<RK, RV> cast<RK, RV>() => internalMap.cast<RK, RV>();

  @override
  V operator [](Object key) => internalMap[key];

  @override
  void operator []=(K key, V value) {
    internalMap[key] = value;
  }

  @override
  void addAll(Map<K, V> other) {
    internalMap.addAll(other);
  }

  @override
  void clear() {
    internalMap.clear();
  }

  @override
  V putIfAbsent(K key, Callback<V> ifAbsent) => internalMap.putIfAbsent(key, ifAbsent);

  @override
  bool containsKey(Object key) => internalMap.containsKey(key);

  @override
  bool containsValue(Object value) => internalMap.containsValue(value);

  @override
  void forEach(Value2Callback<K, V, void> action) {
    internalMap.forEach(action);
  }

  @override
  bool get isEmpty => internalMap.isEmpty;

  @override
  bool get isNotEmpty => internalMap.isNotEmpty;

  @override
  int get length => internalMap.length;

  @override
  Iterable<K> get keys => internalMap.keys;

  @override
  V remove(Object key) => internalMap.remove(key);

  @override
  String toString() => internalMap.toString();

  @override
  Iterable<V> get values => internalMap.values;

  @override
  Iterable<MapEntry<K, V>> get entries => internalMap.entries;

  @override
  void addEntries(Iterable<MapEntry<K, V>> entries) {
    internalMap.addEntries(entries);
  }

  @override
  Map<K2, V2> map<K2, V2>(Value2Callback<K, V, MapEntry<K2, V2>> transform) => internalMap.map<K2, V2>(transform);

  @override
  V update(K key, Value1Callback<V, V> update, {Callback<V> ifAbsent}) => internalMap.update(key, update, ifAbsent: ifAbsent);

  @override
  void updateAll(Value2Callback<K, V, V> update) {
    internalMap.updateAll(update);
  }

  @override
  void removeWhere(Value2Callback<K, V, bool> test) {
    internalMap.removeWhere(test);
  }
}

/// Mixin that overrides mutating map operations with implementations that
/// throw.
///
/// Copy of Dart's internal `_UnmodifiableMapMixin`
mixin UnmodifiableMapMixin<K, V> on Map<K, V> {
  /// This operation is not supported by an unmodifiable map.
  @override
  void operator []=(K key, V value) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  /// This operation is not supported by an unmodifiable map.
  @override
  void addAll(Map<K, V> other) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  /// This operation is not supported by an unmodifiable map.
  @override
  void addEntries(Iterable<MapEntry<K, V>> entries) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  /// This operation is not supported by an unmodifiable map.
  @override
  void clear() {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  /// This operation is not supported by an unmodifiable map.
  @override
  V remove(Object key) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  /// This operation is not supported by an unmodifiable map.
  @override
  void removeWhere(Value2Callback<K, V, bool> test) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  /// This operation is not supported by an unmodifiable map.
  @override
  V putIfAbsent(K key, Callback<V> ifAbsent) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  /// This operation is not supported by an unmodifiable map.
  @override
  V update(K key, Value1Callback<V, V> update, {Callback<V> ifAbsent}) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }

  /// This operation is not supported by an unmodifiable map.
  @override
  void updateAll(Value2Callback<K, V, V> update) {
    throw UnsupportedError('Cannot modify unmodifiable map');
  }
}

/// View of a [Map] that disallow modifying the map.
///
/// A wrapper around a `Map` that forwards all members to the map provided in
/// the constructor, except for operations that modify the map.
/// Modifying operations throw instead.
class UnmodifiableMapView<K, V> extends MapView<K, V> with UnmodifiableMapMixin<K, V> {
  /// Creates a new instance of [UnmodifiableMapView]
  const UnmodifiableMapView(Map<K, V> map) : super(map);

  @override
  UnmodifiableMapView<RK, RV> cast<RK, RV>() => UnmodifiableMapView<RK, RV>(internalMap.cast<RK, RV>());
}
