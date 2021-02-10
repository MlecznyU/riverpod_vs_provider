import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'first_event.dart';

part 'first_state.dart';

class FirstBloc extends Bloc<InviteEvent, FirstState> {
  FirstBloc() : super(InviteInitial());

  @override
  Stream<FirstState> mapEventToState(
    InviteEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }

  void doSomething() {}
}
