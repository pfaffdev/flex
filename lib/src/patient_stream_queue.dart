import 'dart:async';
import 'dart:collection';

import 'package:flex/flex.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart' show Subject;
import 'package:tuple/tuple.dart';

/// A stream that waits for its first listener before emitting events.
///
/// Until recieving its first listener, items will be added to an internal queue using [Queue]
///
/// If all listeners are removed from PatientStreamQueue, they will once again be added to the internal queue
class PatientStreamQueue<E> extends Subject<E> {
  /// Creates a new instance of `PatientStreamQueue`.
  PatientStreamQueue({
    bool sync = false,
  }) : this.internal(StreamController<E>.broadcast(sync: sync));

  /// When specified, `internalController` **must** be a broadcast stream.
  PatientStreamQueue.from([@nullable StreamController<E> internalController]) : this.internal(internalController ?? StreamController.broadcast());

  /// `internalController` **must** be a broadcast stream.
  PatientStreamQueue.internal(this.internalController)
      : _queue = Queue(),
        broadcastStream = internalController.stream.asBroadcastStream(),
        // sink = internalController.sink,
        super(internalController, internalController.stream) {
    internalController.onListen = _onListen;
    internalController.onCancel = _onCancel;
    if (internalController.hasListener) _onListen();
  }

  /// The internal [StreamController] of this [PatientStreamQueue]'s [Stream]
  @protected
  final StreamController<E> internalController;

  /// This [PatientStreamQueue]'s broadcast stream.
  final Stream<E> broadcastStream;

  final Queue<dynamic> _queue;

  State _state = State.uninitialized;

  /// The state (initialized, uninitialized, etc.) of this `PatientStreamQueue`.
  State get state => _state;

  @override
  void onAdd(E event) {
    if (state != State.initialized) _queue.add(event);
  }

  @override
  void onAddError(Object error, [@nullable StackTrace stackTrace]) {
    if (state != State.initialized) _queue.add(Tuple2(error, stackTrace));
  }

  /// Disposes of the entire [PatientStreamQueue]
  Future<void> dispose({bool wait = true}) async {
    final was = _state;
    _state = State.deinitializing;
    if (wait) {
      if (was == State.initialized || was == State.uninitialized) {
        while (_queue.isNotEmpty) {
          // await Future.delayed(const Duration(milliseconds: 1));
        }
      } else {
        sendEncodedEvent('Level.WARNING', 'PatientStreamQueue not initialized or uninitialized. State is $was. Not waiting for disposal.', state);
      }
    }
    await internalController.close();
    _state = State.deinitialized;
  }

  void _onListen() {
    if (state == State.uninitialized || state == State.deinitialized) {
      _state = State.initializing;

      while (_queue.isNotEmpty) {
        final current = _queue.removeFirst();
        if (current is Tuple2<Object, StackTrace>) {
          internalController.addError(current.item1, current.item2);
        } else {
          internalController.add(current);
        }
      }

      _state = State.initialized;
    } else {
      sendEncodedEvent('Level.WARNING', 'PatientStreamQueue not uninitialized. State is $state. Not initializing.', state);
    }
  }

  void _onCancel() {
    if (state == State.initialized) {
      _state = State.deinitializing;

      _state = State.deinitialized;
    } else {
      sendEncodedEvent('Level.WARNING', 'PatientStreamQueue not initialized. State is $state. Not deinitializing.', state);
    }
  }
}
