part of 'sayici_cubit.dart';

@immutable


class SayiciState  {
  int _deger;
  SayiciState(this._deger);

  int get deger => _deger;

  set deger(int value) {
    _deger = value;
  }

}
