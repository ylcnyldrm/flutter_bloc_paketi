import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sayici_state.dart';

class SayiciCubit extends Cubit<SayiciState> {

  SayiciCubit() : super(SayiciState(0));

  void Arttir() {
    emit(SayiciState(state._deger+1));
  }
  void Azalt() {
    emit(SayiciState(state._deger-1));
  }
}
