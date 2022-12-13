import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterState());
  void increment([int incrementvalue=1]){
    final count = state.count + incrementvalue;
    final updateState = CounterState(count: count);
    emit(updateState);
  }
  void decrement([int decrimentvalue=1]){
    final count = state.count - decrimentvalue;
    final updateState = CounterState(count: count);
    emit(updateState);
  }
}
class CounterState{
  final int count;
  CounterState({
    this.count = 0
  });
}
