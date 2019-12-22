import 'dart:async';

/// A template for an optionally-asynchronous callback that returns a particular [R] when given a particular [V1]
typedef FutureOrValue1Callback<V1, R> = FutureOr<R> Function(V1 value1);

/// A template for an optionally-asynchronous callback that returns a particular [R] when given a particular [V1] and [V2]
typedef FutureOrValue2Callback<V1, V2, R> = FutureOr<R> Function(V1 value1, V2 value2);

/// A template for an optionally-asynchronous callback that returns a particular [R] when given a particular [V1], [V2] and [V3]
typedef FutureOrValue3Callback<V1, V2, V3, R> = FutureOr<R> Function(V1 value1, V2 value2, V3 value3);

/// A template for an optionally-asynchronous standalone callback that returns a particular [R]
///
/// Typically used for zero-input generators
typedef FutureOrCallback<R> = FutureOr<R> Function();

/// A template for an optionally-asynchronous callback that tests a value of type [V]
typedef FutureOrValueTest<V> = FutureOr<bool> Function(V value);

/// A template for a callback that returns a particular [R] when given a particular [V]
typedef Value1Callback<V1, R> = R Function(V1 value1);

/// A template for a callback that returns a particular [R] when given a particular [V1] and [V2]
typedef Value2Callback<V1, V2, R> = R Function(V1 value1, V2 value2);

/// A template for a callback that returns a particular [R] when given a particular [V1], [V2] and [V3]
typedef Value3Callback<V1, V2, V3, R> = R Function(V1 value1, V2 value2, V3 value3);

/// A template for a standalone callback that returns a particular [R]
///
/// Typically used for zero-input generators
typedef Callback<R> = R Function();

/// A template for a callback that tests a value of type [V]
typedef ValueTest<V> = bool Function(V value);

/// Placeholder callback
void voidHandler() {}

/// Placeholder asynchronous callback
Future<void> asyncVoidHandler() async {}

/// Placeholder event handler
void voidValueHandler(_) {}

/// Placeholder asynchronous event handler
FutureOr<void> asyncVoidValueHandler(_) {}
