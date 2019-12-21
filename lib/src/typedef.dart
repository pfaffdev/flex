import 'dart:async';

/// A template for an optionally-asynchronous callback that returns a particular [R] when given a particular [V1]
typedef FutureOr<R> FutureOrValue1Callback<V1, R>(V1 value1);

/// A template for an optionally-asynchronous callback that returns a particular [R] when given a particular [V1] and [V2]
typedef FutureOr<R> FutureOrValue2Callback<V1, V2, R>(V1 value1, V2 value2);

/// A template for an optionally-asynchronous callback that returns a particular [R] when given a particular [V1], [V2] and [V3]
typedef FutureOr<R> FutureOrValue3Callback<V1, V2, V3, R>(V1 value1, V2 value2, V3 value3);

/// A template for an optionally-asynchronous standalone callback that returns a particular [R]
///
/// Typically used for zero-input generators
typedef FutureOr<R> FutureOrCallback<R>();

/// A template for an optionally-asynchronous callback that tests a value of type [V]
typedef FutureOr<bool> FutureOrValueTest<V>(V value);

/// A template for a callback that returns a particular [R] when given a particular [V]
typedef R Value1Callback<V1, R>(V1 value1);

/// A template for a callback that returns a particular [R] when given a particular [V1] and [V2]
typedef R Value2Callback<V1, V2, R>(V1 value1, V2 value2);

/// A template for a callback that returns a particular [R] when given a particular [V1], [V2] and [V3]
typedef R Value3Callback<V1, V2, V3, R>(V1 value1, V2 value2, V3 value3);

/// A template for a standalone callback that returns a particular [R]
///
/// Typically used for zero-input generators
typedef R Callback<R>();

/// A template for a callback that tests a value of type [V]
typedef bool ValueTest<V>(V value);

/// Placeholder callback
void voidHandler() {}

/// Placeholder asynchronous callback
Future<void> asyncVoidHandler() async {}

/// Placeholder event handler
void voidValueHandler(_) {}

/// Placeholder asynchronous event handler
FutureOr<void> asyncVoidValueHandler(_) {}

