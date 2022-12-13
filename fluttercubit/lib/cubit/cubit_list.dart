import 'package:bloc/bloc.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(  ListState(history: []));

  void addHistory(String action) {
    List history = state.history;
    history.add(action);
    emit(ListState(history: history));
  }
}

class ListState {
  final List history;

  const ListState({required this.history});
}