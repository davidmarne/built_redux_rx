library test_counter;

import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';

part 'test_counter.g.dart';

abstract class CounterActions extends ReduxActions {
  ActionDispatcher<int> increment;
  ActionDispatcher<int> decrement;
  ActionDispatcher<int> incrementAsync;
  ActionDispatcher<int> decrementAsync;

  CounterActions._();
  factory CounterActions() => new _$CounterActions();
}

Reducer<Counter, CounterBuilder, dynamic> createReducer() =>
    (new ReducerBuilder<Counter, CounterBuilder>()
          ..add(
              CounterActionsNames.increment, (s, a, b) => b.count += a.payload)
          ..add(
              CounterActionsNames.decrement, (s, a, b) => b.count -= a.payload))
        .build();

// Built Reducer
abstract class Counter implements Built<Counter, CounterBuilder> {
  int get count;

  // Built value constructor
  Counter._();
  factory Counter() => new _$Counter._(count: 1);
}
